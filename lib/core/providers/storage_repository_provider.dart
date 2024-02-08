import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../failure.dart';
import '../type_defs.dart';
import 'firebase_providers.dart';

part 'storage_repository_provider.g.dart';

@riverpod
StorageRepository storageRepository(StorageRepositoryRef ref) {
  return StorageRepository(firebaseStorage: ref.read(storageProvider));
}

class StorageRepository {
  final FirebaseStorage _firebaseStorage;

  const StorageRepository({
    required FirebaseStorage firebaseStorage,
  }) : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile({
    required String path,
    required String id,
    required File? file,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);

      UploadTask uploadTask = ref.putFile(file!);
      final snapshot = await uploadTask;
      return right(await snapshot.ref.getDownloadURL());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
