import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/common/const/color.dart';
import 'package:todo_list/common/layout/default_layout.dart';
import 'package:todo_list/common/screen/splash_screen.dart';
import 'package:todo_list/todo/provider/todo_provider.dart';
import 'package:todo_list/todo/screen/todo_list_screen.dart';
import 'package:todo_list/user/model/user_model.dart';
import 'package:todo_list/user/provider/user_me_provider.dart';

class RootTab extends ConsumerStatefulWidget {
  static String get routeName => 'home';

  const RootTab({super.key});

  @override
  ConsumerState<RootTab> createState() => _RootTabState();
}

class _RootTabState extends ConsumerState<RootTab>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int idx = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      idx = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userMeProvider);
    // TAB 프로바이더 필요!!!

    // final state = ref.watch(todoProvider.notifier).paginate(id: '11111');

    if (userState is UserModelLoading) {
      return DefaultLayout(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (userState is UserModelError) {
      return DefaultLayout(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userState.message,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  ref.read(userMeProvider.notifier).login();
                },
                child: Text(
                  '다시시도',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (userState == null) {
      return DefaultLayout(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final currentUser = userState as UserModel;

    return DefaultLayout(
      appBar: AppBar(
        title: Center(
          child: Text(
            '${currentUser.username} Tasks',
          ),
        ),
        bottom: TabBar(
          // isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blue,
          indicatorColor: Colors.blue,
          controller: controller,
          tabs: [
            Tab(
              child: Text('내 할 일 목록'),
            ),
            Tab(
              child: Text('TEST1'),
            ),
            Tab(
              child: Text('TEST2'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          TodoListScreen(),
          TodoListScreen(),
          TodoListScreen(),
        ],
      ),
    );
  }
}
