import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/user_model.dart';
import '../../../core/utils.dart';
import '../repository/auth_repositoy.dart';

part 'auth_cotroller.g.dart';

@riverpod
class SignedInUser extends _$SignedInUser {
  @override
  UserModel? build() {
    return null;
  }

  void update(UserModel? Function(UserModel?) cb) {
    state = cb(state);
  }
}

@riverpod
Stream<User?> authStateChanged(AuthStateChangedRef ref) {
  return ref.watch(authRepositoyProvider.select((value) => value.authStateChanged));
}

@riverpod
Stream<UserModel?> getUserData(GetUserDataRef ref, String uid) {
  return ref.watch(authControllerProvider.notifier).getUserData(uid);
}

@riverpod
class AuthController extends _$AuthController {
  late final AuthRepositoy _authRepositoy = ref.read(authRepositoyProvider);

  @override
  bool build() {
    return false;
  }

  void signWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepositoy.signWithGoogle();
    state = false;

    user.fold(
      (l) => showSnackBar(context, l.message),
      (foundUser) {
        ref.read(signedInUserProvider.notifier).update((state) => foundUser);
      },
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepositoy.getUserData(uid);
  }
}
