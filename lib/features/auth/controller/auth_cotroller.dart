import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/auth_repositoy.dart';

part 'auth_cotroller.g.dart';

@riverpod
AuthController authController(AuthControllerRef ref) => AuthController(
      authRepositoy: ref.read(authRepositoyProvider),
    );

class AuthController {
  const AuthController({required AuthRepositoy authRepositoy}) : _authRepositoy = authRepositoy;
  final AuthRepositoy _authRepositoy;

  void signWithGoogle() async {
    _authRepositoy.signWithGoogle();
  }
}
