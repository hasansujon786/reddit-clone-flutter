import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/failure.dart';
import '../../../core/models/community.dart';
import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';

part 'community_repository.g.dart';

@riverpod
CommunityRepository communityRepository(CommunityRepositoryRef ref) {
  return CommunityRepository(firestore: ref.read(firestoreProvider));
}

class CommunityRepository {
  const CommunityRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  CollectionReference get _communityCollection => _firestore.collection(FirebaseConstants.communitiesCollection);

  FutureVoid createCommunity(Community community) async {
    try {
      final communityDoc = await _communityCollection.doc(community.name).get();
      if (communityDoc.exists) {
        throw 'Community with the same name exists';
      }

      return right(_communityCollection.doc(community.name).set(community.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Community>> getUserCommunities(String uid) {
    return _communityCollection.where('members', arrayContains: uid).snapshots().map((event) {
      List<Community> foundCommunities = [];
      for (var doc in event.docs) {
        foundCommunities.add(Community.fromJson(doc.data() as JsonMap));
      }

      return foundCommunities;
    });
  }

  Stream<Community> getCommunityByName(String name) {
    return _communityCollection.doc(name).snapshots().map((event) => Community.fromJson(event.data() as JsonMap));
  }
}
