import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/data/model/todo_entity.dart';
import 'package:tasks/data/repository/todo_repository.dart';

class HomeViewModel extends Notifier<List<ToDoEntity>> {
  @override
  List<ToDoEntity> build() {
    getAllToDo();
    return [];
  }

  void getAllToDo() async {
    final todoRepo = Todorepository();
    final todos = await todoRepo.getToDos();
    state = todos ?? [];
  }
}

final homeViewModel = NotifierProvider<HomeViewModel, List<ToDoEntity>>(() {
  return HomeViewModel();
});
