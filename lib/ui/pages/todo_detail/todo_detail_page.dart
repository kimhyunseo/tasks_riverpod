import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks/data/model/todo_entity.dart';

// 6. To DO 상세 보기 화면 만들기
class TodoDetailPage extends StatefulWidget {
  const TodoDetailPage({
    super.key,
    required this.todoList,
    required this.index,
    required this.onToggleFavorite,
    required this.deleteTodo,
    required this.editTodo,
  });
  final List<ToDoEntity> todoList;
  final int index;
  final VoidCallback onToggleFavorite;
  final VoidCallback deleteTodo;
  final void Function(String, String, String) editTodo;

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.todoList[widget.index].title,
    );
    descriptionController = TextEditingController(
      text: widget.todoList[widget.index].description ?? "",
    );
  }

  // 수정한 할 일 저장 함수
  void editAndSaveTodo() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("저장 확인"),
        content: Text("변경된 내용을 저장하시겠습니까?"),
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
              widget.editTodo(
                widget.todoList[widget.index].id,
                titleController.text,
                descriptionController.text,
              );
              Navigator.pop(context);
            },
            child: Text("저장"),
          ),
        ],
      ),
    );
  }

  // 할 일 삭제 함수
  void deleteTodo(BuildContext context) {
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
              widget.deleteTodo();
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("삭제"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          // 6-1.  favorite 변경 구현
          IconButton(
            onPressed: widget.onToggleFavorite,
            icon: widget.todoList[widget.index].isFavorite
                ? Icon(Icons.star_rounded, size: 28)
                : Icon(Icons.star_border_rounded, size: 28),
          ),
          IconButton(
            onPressed: () {
              deleteTodo(context);
            },
            icon: Icon(Icons.delete_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),

        onPressed: () {
          editAndSaveTodo();
        },
        icon: const Icon(Icons.save),
        label: const Text("저장하기"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              minLines: 1,
              maxLines: 3,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                editAndSaveTodo();
              },
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.short_text_rounded, size: 32),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: descriptionController,
                    minLines: 1,
                    maxLines: 8,
                    textInputAction: TextInputAction.newline,
                    onSubmitted: (_) {
                      editAndSaveTodo();
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
