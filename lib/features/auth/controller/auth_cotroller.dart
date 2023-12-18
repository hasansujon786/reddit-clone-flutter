import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/user_model.dart';
import '../../../core/utils.dart';
import '../repository/auth_repositoy.dart';

part 'auth_cotroller.g.dart';

@riverpod
class User extends _$User {
  @override
  UserModel? build() {
    return null;
  }

  void setUser(UserModel newUser) {
    state = newUser;
  }
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
    print('------------ signWithGoogle -------------');
    final user = await _authRepositoy.signWithGoogle();
    state = false;

    user.fold(
      (l) => showSnackBar(context, l.message),
      (foundUser) {
        ref.read(userProvider.notifier).setUser(foundUser);
      },
    );
  }
}
