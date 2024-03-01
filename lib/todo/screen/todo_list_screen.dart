import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/user/provider/user_me_provider.dart';

class TodoListScreen extends ConsumerStatefulWidget {
  const TodoListScreen({super.key});

  @override
  ConsumerState<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends ConsumerState<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('내 할 일 목록11'),
          ElevatedButton(
            onPressed: () {
              ref.read(userMeProvider.notifier).logout();
            },
            child: Text('로그아웃'),
          ),
        ],
      ),
    );
  }
}
