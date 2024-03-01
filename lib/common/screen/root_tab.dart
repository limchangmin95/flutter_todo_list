import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/common/component/custom_text_field.dart';
import 'package:todo_list/common/const/color.dart';
import 'package:todo_list/common/layout/default_layout.dart';
import 'package:todo_list/common/screen/splash_screen.dart';
import 'package:todo_list/todo/model/todo_category_model.dart';
import 'package:todo_list/todo/model/todo_list_model.dart';
import 'package:todo_list/todo/provider/todo_provider.dart';
import 'package:todo_list/todo/screen/todo_category_register_screen.dart';
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
    print('initState START!!!!');
    controller = TabController(length: 3, vsync: this);
    controller.addListener(tabListener);
    // List<TodoCategoryModel> categoryList = [];
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //    categoryList = ref.watch(todoProvider).categoryList.data;
    // });
    //
    // print('categoryList : $categoryList');
    //
    // Provider.autoDispose((ref) {
    //   controller = TabController(
    //     length: ref.watch(todoProvider).categoryList.data.length,
    //     vsync: this,
    //   );
    // });
    //
    // if (controller != null) {
    //   controller!.addListener(tabListener);
    // }
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
                  style: TextStyle(color: Colors.white),
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
    // final AsyncValue<TodoListModel> state = ref
    //     .watch(todoProvider as ProviderListenable<AsyncValue<TodoListModel>>);

    final state = ref.watch(todoProvider);
    print('state : $state');
    // controller.length = categoryList.length;

    return DefaultLayout(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.blue,
            size: 35.0,
          ),
          onPressed: () {
            renderBottomSheet();
          },
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              '${currentUser.username} Tasks',
            ),
          ),
          actions: [
            SizedBox(
              width: 40,
              height: 40,
              child: ElevatedButton(
                clipBehavior: Clip.antiAlias,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0)),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Image.network(
                  userState.imageUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          bottom:

              //   state.when(
              //   data: (item) {
              //     controller = TabController(
              //         vsync: this, length: item.categoryList.data.length);
              //
              //     controller.animateTo(item.categoryList.data.length - 1);
              //
              //     return TabBar(
              //       controller: controller,
              //       // isScrollable: true,
              //       indicatorSize: TabBarIndicatorSize.tab,
              //       unselectedLabelColor: Colors.grey,
              //       labelColor: Colors.blue,
              //       indicatorColor: Colors.blue,
              //       tabs: [
              //         ...item.categoryList.data
              //             .map(
              //               (e) => Tab(
              //                 child: Text(
              //                   e.tdCategoryNm,
              //                 ),
              //               ),
              //             )
              //             .toList(),
              //         Tab(
              //           child: Text(
              //             '새목록+',
              //           ),
              //         )
              //       ],
              //     );
              //   },
              //   error: (error, stack) => null,
              //   loading: () => null,
              // ),
              TabBar(
            controller: controller,
            // isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                child: Text('내 할 일 목록'),
              ),
              Tab(
                child: Text('TEST1'),
              ),
              TextButton(
                onPressed: () {
                  context.goNamed(TodoCategoryRegisterScreen.routeName);
                },
                child: Text(
                  '새목록+',
                  style: TextStyle(
                    color: BODY_TEXT_COLOR,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            TodoListScreen(),
            TodoListScreen(),
            TodoListScreen(),
          ],
        )

        // state.when(
        //   data: (item) {
        //     return TabBarView(
        //       controller: controller,
        //       physics: NeverScrollableScrollPhysics(),
        //       children: [
        //         ...item.categoryList.data
        //             .map(
        //               (e) => TodoListScreen(),
        //             )
        //             .toList(),
        //         TodoCategoryRegisterScreen(),
        //       ],
        //     );
        //   },
        //   error: (error, stack) => Center(
        //     child: Text(
        //       error.toString(),
        //     ),
        //   ),
        //   loading: () => Center(
        //     child: CircularProgressIndicator(),
        //   ),
        // ),
        // TabBarView(
        //   controller: controller,
        //   physics: NeverScrollableScrollPhysics(),
        //   children: [
        //     ,
        //     TodoCategoryRegisterScreen(),
        //   ],
        // ),
        );
  }

  void renderBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) => Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  CustomTextField(
                    onChanged: (String valye) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.subject,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.access_time,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star_border_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '저장',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
