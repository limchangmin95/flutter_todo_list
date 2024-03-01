import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list/user/model/user_model.dart';
import 'package:todo_list/user/repository/google_sign_repository.dart';

final userMeProvider =
    StateNotifierProvider<UserMeStateNotifier, UserModelBase?>((ref) {
  return UserMeStateNotifier();
});

class UserMeStateNotifier extends StateNotifier<UserModelBase?> {
  UserMeStateNotifier()
      : super(
          UserModelLoading(),
        ) {
    getMe();
  }

  Future<void> getMe() async {
    final GoogleSignInAccount? user = GoogleSignRepository.currentUser();

    if (user == null) {
      state = null;
      return;
    } else {
      final res = UserModel(
        id: user.id,
        imageUrl: user.photoUrl ?? '',
        username: user.displayName ?? '',
      );
      state = res;
    }
  }

  Future<UserModelBase?> login() async {
    try {
      print('provider Login START!!!!!');

      state = UserModelLoading();

      final user = await GoogleSignRepository.login();

      print('userMeProvider login : $user');

      if (user == null) {
        state = null;
        return null;
      } else {
        final userRes = UserModel(
          id: user.id,
          username: user.displayName ?? '',
          imageUrl: user.photoUrl ?? '',
        );

        print('userRes START!!! : $userRes');

        state = userRes;

        return userRes;
      }
    } catch (e) {
      print('e : $e');
      print('e.toString : ${e.toString()}');
      state = UserModelError(message: '로그인에 실패했습니다');
      return Future.value(state);
    }
  }

  Future<void> logout() async {
    await GoogleSignRepository.logout();

    state = null;
  }
}
