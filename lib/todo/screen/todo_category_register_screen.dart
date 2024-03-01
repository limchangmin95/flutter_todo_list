import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/common/component/custom_text_field.dart';
import 'package:todo_list/common/const/color.dart';
import 'package:todo_list/common/layout/default_layout.dart';
import 'package:todo_list/common/screen/root_tab.dart';
import 'package:todo_list/todo/provider/todo_provider.dart';
import 'package:todo_list/todo/repository/todo_repository.dart';
import 'package:todo_list/user/repository/google_sign_repository.dart';

class TodoCategoryRegisterScreen extends ConsumerStatefulWidget {
  static String get routeName => 'categoryCreate';

  const TodoCategoryRegisterScreen({super.key});

  @override
  ConsumerState<TodoCategoryRegisterScreen> createState() =>
      _TodoCategoryRegisterScreenState();
}

class _TodoCategoryRegisterScreenState
    extends ConsumerState<TodoCategoryRegisterScreen> {
  String categoryNm = '';

  @override
  Widget build(BuildContext context) {
    final user = GoogleSignRepository.currentUser();

    return DefaultLayout(
      appBar: AppBar(
        title: Center(
          child: Text(
            '새 목록 만들기',
          ),
        ),
        actions: [
          TextButton(
            onPressed: categoryNm.isNotEmpty
                ? () {
                    ref.read(todoRepositoryProvider).categoryRegister({
                      'id': user!.id,
                      'td_category_nm': categoryNm,
                    });
                    context.goNamed(RootTab.routeName);
                  }
                : null,
            child: Text(
              '완료',
              style: TextStyle(
                color: categoryNm.isNotEmpty ? Colors.blue : BODY_TEXT_COLOR,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CustomTextField(
              hintText: '목록 제목 입력',
              onChanged: (String value) {
                setState(() {
                  categoryNm = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
