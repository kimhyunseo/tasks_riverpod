import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/ui/pages/home/home_view_model.dart';

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
          IconButton(
            onPressed: () {},
            icon: Icon(
              todo.isDone ? Icons.check_circle_rounded : Icons.circle_outlined,

              size: 24,
            ),
          ),
          SizedBox(width: 12),

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
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: SizedBox(
                width: 40,
                height: 40,
                child: todo.isFavorite
                    ? Icon(Icons.star_rounded)
                    : Icon(Icons.star_border_rounded),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: SizedBox(width: 40, height: 40, child: Icon(Icons.delete)),
            ),
          ),
        ],
      ),
    );
  }
}
