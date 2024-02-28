import 'package:flutter/material.dart';
import 'package:todo_list/common/const/color.dart';
import 'package:todo_list/common/layout/default_layout.dart';
import 'package:todo_list/common/screen/root_tab.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) {
                      return RootTab();
                    }),
                    (route) => false,
                  );
                },
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
}
