// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/data/model/todo_entity.dart';
import 'package:tasks/ui/pages/home/home_view_model.dart';
import 'package:tasks/utils/dialog_utils.dart';
import 'package:tasks/utils/snackbar_utils.dart';

// 6. To DO 상세 보기 화면 만들기
class TodoDetailPage extends ConsumerStatefulWidget {
  const TodoDetailPage({super.key, required this.todoId});

  final String todoId;

  @override
  ConsumerState<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends ConsumerState<TodoDetailPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  bool _isControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  // 수정한 할 일 저장 함수
  void editTodo() {
    showConfirmationDialog(
      context: context,
      title: "저장 확인",
      content: "변경된 내용을 저장하시겠습니까?",
      confirmText: "저장",
      isDestructive: true,
      onConfirm: () async {
        final vm = ref.read(homeViewModel.notifier);
        final todos = ref.read(homeViewModel);
        final todo = todos.firstWhere((todo) => todo.id == widget.todoId);

        final updatedTodo = ToDoEntity(
          id: widget.todoId,
          title: titleController.text,
          description: descriptionController.text,
          isFavorite: todo.isFavorite,
          isDone: todo.isDone,
          createdAt: DateTime.now(),
        );

        await vm.editTodo(todo: updatedTodo);
        SnackbarUtils.showSnackBr(context, "할 일이 수정되었습니다");
      },
    );
  }

  // 할 일 삭제 함수
  void deleteTodo(BuildContext context) {
    showConfirmationDialog(
      context: context,
      title: "삭제 확인",
      content: "정말 삭제하시겠습니까?",
      confirmText: "삭제",
      isDestructive: true,
      onConfirm: () {
        final vm = ref.read(homeViewModel.notifier);
        final todos = ref.read(homeViewModel);
        final deletedTodo = todos.firstWhere((t) => t.id == widget.todoId);

        if (mounted) {
          Navigator.pop(context);
        }

        vm.deleteTodo(id: widget.todoId);

        SnackbarUtils.showActionSnackBar(
          context: context,
          text: "할 일이 삭제되었습니다",
          actionLabel: "취소",
          onAction: () async {
            vm.saveTodo(todo: deletedTodo);
            await vm.fetch();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(homeViewModel);
    final todo = todos.where((todo) => todo.id == widget.todoId).firstOrNull;

    if (todo != null && !_isControllerInitialized) {
      titleController.text = todo.title;
      descriptionController.text = todo.description ?? '';
      _isControllerInitialized = true;
    }

    return todo != null
        ? Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    final vm = ref.read(homeViewModel.notifier);
                    vm.toggleFavorite(
                      id: widget.todoId,
                      isFavorite: !todo.isFavorite,
                    );
                  },
                  icon: todo.isFavorite
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
                editTodo();
              },
              icon: const Icon(Icons.save),
              label: const Text("저장하기"),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
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
                      editTodo();
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
                            editTodo();
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
          )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
