import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/common/const/color.dart';
import 'package:todo_list/common/layout/default_layout.dart';
import 'package:todo_list/common/screen/root_tab.dart';
import 'package:todo_list/user/provider/user_me_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String get routeName => 'splash';

  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35.0,
                ),
              ),
              Image.asset(
                'asset/img/logo/logo.png',
                width: 300,
                height: 300,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(160, 50),
                ),
                onPressed: login,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "asset/img/misc/google.png",
                      width: 30,
                      height: 30,
                    ),
                    const Text(
                      '구글 로그인',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    final user = await ref.read(userMeProvider.notifier).login();

    print('login START1111111!!!');
    print('user Login : $user');
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "로그인에 실패했습니다.",
          ),
        ),
      );
    }

    print('login START2222222!!!');
  }
}
