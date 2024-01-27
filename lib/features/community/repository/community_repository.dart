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

  FutureEitherVoid createCommunity(Community community) async {
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

  FutureEitherVoid editCommunity(Community community) async {
    try {
      return right(_communityCollection.doc(community.name).update(community.toJson()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEitherVoid joinCommunity(String communityName, String uid) async {
    try {
      return right(_communityCollection.doc(communityName).update({
        'members': FieldValue.arrayUnion([uid])
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEitherVoid leaveCommunity(String communityName, String uid) async {
    try {
      return right(_communityCollection.doc(communityName).update({
        'members': FieldValue.arrayRemove([uid])
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Community>> searchCommunity(String query) {
    // INFO: Learn how to search in firebase
    return _communityCollection
        .where(
          'name',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map((event) {
      List<Community> communities = [];
      for (var community in event.docs) {
        communities.add(Community.fromJson(community.data() as Map<String, dynamic>));
      }
      return communities;
    });
  }

  FutureEitherVoid addMods(String communityName, List<String> uids) async {
    try {
      return right(_communityCollection.doc(communityName).update({
        'mods': uids,
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
