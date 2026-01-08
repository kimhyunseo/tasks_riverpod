import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/ui/pages/todo_list/widgets/todo_list_item.dart';
import 'package:tasks/ui/pages/detail/detail_page.dart';

// 5. To do가 추가된 화면 만들기

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 150),
      itemCount: 1,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TodoDetailPage();
                },
              ),
            );
          },
          onLongPress: () {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text("삭제 확인"),
                content: Text("정말 삭제하시겠습니까?"),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("취소"),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {},
                    child: Text("삭제"),
                  ),
                ],
              ),
            );
          },
          child: ToDoWidget(),
        );
      },
    );
  }
}
