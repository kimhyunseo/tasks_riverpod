import 'package:flutter/material.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({super.key});

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
            onPressed: () {},
            icon: Icon(
              // todo.isDone ? Icons.check_circle_rounded : Icons.circle_outlined,
              Icons.circle_outlined,
              size: 24,
            ),
          ),
          SizedBox(width: 12),

          Expanded(
            child: Text(
              '제목 들어갈 부분',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                // decoration: todo.isDone
                //     ? TextDecoration.lineThrough
                //     : TextDecoration.none,
              ),
            ),
          ),
          // 5-1. 버튼이 눌렸을 때 favorite 상태 변경
          IconButton(
            onPressed: () {},
            // icon: todo.isFavorite
            //     ? Icon(Icons.star_rounded, size: 28)
            //     : Icon(Icons.star_border_rounded, size: 28),
            icon: Icon(Icons.star_rounded, size: 28),
          ),
        ],
      ),
    );
  }
}
