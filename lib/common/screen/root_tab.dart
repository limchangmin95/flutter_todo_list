import 'package:flutter/material.dart';
import 'package:todo_list/common/const/color.dart';
import 'package:todo_list/common/layout/default_layout.dart';
import 'package:todo_list/common/screen/splash_screen.dart';
import 'package:todo_list/todo/screen/todo_list_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
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
    // TAB 프로바이더 필요!!!

    return DefaultLayout(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Tasks',
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
