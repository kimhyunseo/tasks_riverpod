import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/ui/pages/home/home_view_model.dart';
import 'package:tasks/utils/dialog_utils.dart';
import 'package:tasks/utils/snackbar_utils.dart';

class ToDoWidget extends ConsumerWidget {
  const ToDoWidget({super.key, required this.todoId});

  final String todoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(homeViewModel);
    final todo = todos.firstWhere((todo) => todo.id == todoId);
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 50),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                final vm = ref.read(homeViewModel.notifier);
                vm.toggleDone(id: todoId, isDone: !todo.isDone);
              },
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  todo.isDone
                      ? Icons.check_circle_rounded
                      : Icons.circle_outlined,
                ),
              ),
            ),
          ),

          SizedBox(width: 4),

          Expanded(
            child: Text(
              todo.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 즐겨찾기
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                final vm = ref.read(homeViewModel.notifier);
                vm.toggleFavorite(id: todoId, isFavorite: !todo.isFavorite);
              },
              child: SizedBox(
                width: 40,
                height: 40,
                child: todo.isFavorite
                    ? Icon(Icons.star_rounded)
                    : Icon(Icons.star_border_rounded),
              ),
            ),
          ),

          // 휴지통
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                showConfirmationDialog(
                  context: context,
                  title: "삭제 확인",
                  content: "정말 삭제하시겠습니까?",
                  confirmText: "삭제",
                  isDestructive: true,
                  onConfirm: () async {
                    final vm = ref.read(homeViewModel.notifier);
                    final deletedTodo = todos.firstWhere((t) => t.id == todoId);

                    await vm.deleteTodo(id: todoId);

                    SnackbarUtils.showActionSnackBar(
                      context: context,
                      text: "할 일이 삭제되었습니다",
                      actionLabel: "취소",
                      onAction: () async {
                        final restoredTodo = deletedTodo.copyWith(id: '');
                        vm.saveTodo(todo: restoredTodo);
                        await vm.fetch();
                      },
                    );
                  },
                );
              },
              child: SizedBox(width: 40, height: 40, child: Icon(Icons.delete)),
            ),
          ),
        ],
      ),
    );
  }
}
