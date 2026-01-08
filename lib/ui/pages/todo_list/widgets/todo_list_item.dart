import 'package:flutter/material.dart';
import 'package:tasks/data/model/todo_entity.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({
    super.key,
    required this.todo,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  final ToDoEntity todo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            onPressed: onToggleDone,
            icon: Icon(
              todo.isDone ? Icons.check_circle_rounded : Icons.circle_outlined,
              size: 24,
            ),
          ),
          SizedBox(width: 12),

          Expanded(
            child: Text(
              overflow: TextOverflow.ellipsis,
              todo.title,
              style: TextStyle(
                // 5-1 Done 상태에 따라 취소선 상태 적용
                decoration: todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          // 5-1. 버튼이 눌렸을 때 favorite 상태 변경
          IconButton(
            onPressed: () {
              onToggleFavorite();
            },
            icon: todo.isFavorite
                ? Icon(Icons.star_rounded, size: 28)
                : Icon(Icons.star_border_rounded, size: 28),
          ),
        ],
      ),
    );
  }
}
