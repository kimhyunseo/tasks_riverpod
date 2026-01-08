import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/data/model/todo_entity.dart';
import 'package:tasks/ui/pages/home/widgets/todo_widget.dart';
import 'package:tasks/ui/pages/todo_detail/todo_detail_page.dart';

// 5. To do가 추가된 화면 만들기

class TodoView extends StatelessWidget {
  const TodoView({
    super.key,
    required this.todoList,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.deleteTodo,
    required this.editTodo,
  });

  final List<ToDoEntity> todoList;
  final void Function(String id) onToggleFavorite;
  final void Function(String id) onToggleDone;
  final void Function(String id) deleteTodo;
  final void Function(String id, String title, String description) editTodo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 150),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(todoList[index].id),
          direction: DismissDirection.horizontal,
          confirmDismiss: (direction) {
            if (direction == DismissDirection.startToEnd) {
              // 완료 처리
              onToggleDone(todoList[index].id);
              return Future.value(false); // 아이템 삭제 안함
            } else if (direction == DismissDirection.endToStart) {
              // 삭제 처리
              return showCupertinoDialog<bool>(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text("삭제 확인"),
                  content: Text("정말 삭제하시겠습니까?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text("취소"),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text("삭제"),
                    ),
                  ],
                ),
              ).then((value) => value ?? false);
            }
            return Future.value(false);
          },
          onDismissed: (direction) {
            deleteTodo(todoList[index].id);
          },
          background: Container(
            color: Colors.green,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.check, color: Colors.white),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TodoDetailPage(
                      index: index,
                      todoList: todoList,
                      onToggleFavorite: () =>
                          onToggleFavorite(todoList[index].id),
                      deleteTodo: () => deleteTodo(todoList[index].id),
                      editTodo: editTodo,
                    );
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
                      onPressed: () {
                        deleteTodo(todoList[index].id);
                        Navigator.pop(context);
                      },
                      child: Text("삭제"),
                    ),
                  ],
                ),
              );
            },
            child: ToDoWidget(
              todo: todoList[index],
              onToggleFavorite: () {
                onToggleFavorite(todoList[index].id);
              },
              onToggleDone: () {
                onToggleDone(todoList[index].id);
              },
            ),
          ),
        );
      },
    );
  }
}
