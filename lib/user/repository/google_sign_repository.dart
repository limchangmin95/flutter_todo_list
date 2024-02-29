import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider =
    FutureProvider<GoogleSignInAccount?>((ref) async {
  final GoogleSignInAccount? user = await GoogleSignRepository.login();

  return user;
});

class GoogleSignRepository {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future<void> logout() => _googleSignIn.disconnect();

  static GoogleSignInAccount? currentUser() => _googleSignIn.currentUser;
}
