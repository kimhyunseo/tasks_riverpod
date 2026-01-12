import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tasks/ui/pages/home/home_view_model.dart';
import 'package:tasks/ui/pages/home/weather_info_view_model.dart';
import 'package:tasks/ui/pages/home/widgets/empty_todo.dart';
import 'package:tasks/ui/pages/home/widgets/home_bottom_bar.dart';
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

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  final String appName = 'Hyunseo\'s Tasks';

  late final DateFormat _dateFormat;
  DateTime? _lastUpdated;
  bool _justUpdated = false;

  @override
  void initState() {
    super.initState();

    _dateFormat = DateFormat('yy년 M월 d일 HH시 mm분', 'ko_KR');

    _loadLocation();
  }

  Future<void> _loadLocation() async {
    await ref.read(weatherInfoViewModel.notifier).updateWeather();

    setState(() {
      _lastUpdated = DateTime.now();
    });
  }

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
            builder: (context) => WriteTodo(),
          );
        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: HomeBottomBar(
        dateFormat: _dateFormat,
        lastUpdated: _lastUpdated,
        justUpdated: _justUpdated,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _loadLocation();

          setState(() {
            _justUpdated = true;
          });

          await Future.delayed(const Duration(seconds: 1));
          if (!mounted) return;

          setState(() {
            _justUpdated = false;
          });
        },

        child: homeState.isEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [EmptyTodo(appName: appName)],
              )
            : TodoView(),
      ),
    );
  }
}
