import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/ui/pages/home/home_view_model.dart';
import 'package:tasks/ui/pages/home/widgets/empty_todo.dart';
import 'package:tasks/ui/pages/write_todo/write_todo.dart';
import 'package:tasks/ui/pages/todo_list/todo_list_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.themeMode,
  });
  final void Function() toggleTheme;
  final ThemeMode themeMode;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final String appName = 'Hyunseo\'s Tasks';

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModel);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => PlusTodo(),
          );
        },
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [
          homeState.isEmpty ? EmptyTodo(appName: appName) : TodoView(),
        ],
      ),
    );
  }
}
