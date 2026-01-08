import 'package:flutter/material.dart';
import 'package:tasks/ui/pages/home/widgets/empty_todo.dart';
import 'package:tasks/ui/pages/write_todo/write_todo.dart';
import 'package:tasks/data/model/todo_entity.dart';
import 'package:tasks/ui/pages/todo_list/todo_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.themeMode,
  });
  final void Function() toggleTheme;
  final ThemeMode themeMode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String appName = 'Hyunseo\'s Tasks';
  List<ToDoEntity> todoList = [];

  void onCreate(ToDoEntity newTodo) {
    setState(() {
      todoList.add(newTodo);
    });
  }

  void toggleFavorite(String id) {
    final todoIndex = todoList.indexWhere((todo) => todo.id == id);
    if (todoIndex == -1) return;

    setState(() {
      todoList[todoIndex] = todoList[todoIndex].copyWith(
        id: todoList[todoIndex].id,
        isFavorite: !todoList[todoIndex].isFavorite,
      );
    });
  }

  void toggleDone(String id) {
    final todoIndex = todoList.indexWhere((todo) => todo.id == id);
    if (todoIndex == -1) return;
    setState(() {
      todoList[todoIndex] = todoList[todoIndex].copyWith(
        id: todoList[todoIndex].id,
        isDone: !todoList[todoIndex].isDone,
      );
    });
  }

  void deleteTodo(String id) {
    final todoIndex = todoList.indexWhere((todo) => todo.id == id);
    if (todoIndex == -1) return;
    setState(() {
      todoList.removeAt(todoIndex);
    });
  }

  void editTodo(String id, String editTitle, String editDescription) {
    final todoIndex = todoList.indexWhere((todo) => todo.id == id);
    if (todoIndex == -1) return;
    setState(() {
      todoList[todoIndex] = todoList[todoIndex].copyWith(
        id: todoList[todoIndex].id,
        title: editTitle,
        description: editDescription,
      );
    });
  }

  // Todo 추가하는 화면으로 넘어가는 함수
  void addTodo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => PlusTodo(onCreate: onCreate),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLight = widget.themeMode == ThemeMode.light;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.toggleTheme();
            },

            icon: Icon(isLight ? Icons.nightlight : Icons.sunny),
          ),
        ],
      ),
      // 3-3 theme에서 버튼 모양과 색 적용 및 addTodo 함수 연결
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [
          // 5-1 To DO가 없을 떄는 처음 만들었는 3번에서 만든 위젯 있을 때는 TodoView가 보이게 구현
          todoList.isEmpty
              ? EmptyTodo(appName: appName)
              : Expanded(
                  child: TodoView(
                    todoList: todoList,
                    onToggleDone: toggleDone,
                    onToggleFavorite: toggleFavorite,
                    deleteTodo: deleteTodo,
                    editTodo: editTodo,
                  ),
                ),
        ],
      ),
    );
  }
}
