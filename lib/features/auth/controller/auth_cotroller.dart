import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils.dart';
import '../repository/auth_repositoy.dart';

part 'auth_cotroller.g.dart';

@riverpod
AuthController authController(AuthControllerRef ref) => AuthController(
      authRepositoy: ref.read(authRepositoyProvider),
    );

class AuthController {
  const AuthController({required AuthRepositoy authRepositoy}) : _authRepositoy = authRepositoy;
  final AuthRepositoy _authRepositoy;

  void signWithGoogle(BuildContext context) async {
    final user = await _authRepositoy.signWithGoogle();

    user.fold((l) => showSnackBar(context, l.message), (r) {
      print('------ user signed in ------');
      print(r.uid);
    });
  }
}
