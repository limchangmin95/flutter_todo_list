import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/common/screen/root_tab.dart';
import 'package:todo_list/common/screen/splash_screen.dart';
import 'package:todo_list/todo/screen/todo_category_register_screen.dart';
import 'package:todo_list/user/model/user_model.dart';
import 'package:todo_list/user/provider/user_me_provider.dart';
import 'package:go_router/go_router.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({
    required this.ref,
  }) {
    ref.listen<UserModelBase?>(userMeProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: RootTab.routeName,
          builder: (_, __) => const RootTab(),
          routes: [
            GoRoute(
              path: 'splash',
              name: SplashScreen.routeName,
              builder: (_, __) => const SplashScreen(),
            ),
            GoRoute(
              path: 'categoryCreate',
              name: TodoCategoryRegisterScreen.routeName,
              builder: (_, __) => const TodoCategoryRegisterScreen(),
            ),
          ],
        ),
      ];

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final UserModelBase? user = ref.read(userMeProvider);

    final logginIn = state.location == '/';

    // 유저 정보가 없는데
    // 로그인중이면 그대로 로그인 페이지에 두고
    // 로그인중이 아니라면 로그인 페이지로 이동
    if (user == null) {
      return '/splash';
    }

    // user가 null이 아님

    // UserModel
    // 사용자 정보가 있는 상태라면
    // 로그인중이거나 현재 위치가 SplashScreen이면
    // 홈으로 이동
    if (user is UserModel) {
      return logginIn || state.location == '/splash' ? '/' : null;
    }

    if (user is UserModelError) {
      return !logginIn ? '/' : null;
    }

    return null;
  }
}
