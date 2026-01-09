import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/ui/pages/home/home_view_model.dart';
import 'package:tasks/ui/pages/todo_list/widgets/todo_list_item.dart';
import 'package:tasks/ui/pages/detail/detail_page.dart';

// 5. To do가 추가된 화면 만들기

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(homeViewModel);
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 150),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TodoDetailPage(todoId: todos[index].id);
                  },
                ),
              );
            },

            child: ToDoWidget(todoId: todos[index].id),
          );
        },
      ),
    );
  }
}
