import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/data/model/todo_entity.dart';
import 'package:tasks/data/repository/todo_repository.dart';

class HomeViewModel extends Notifier<List<ToDoEntity>> {
  @override
  List<ToDoEntity> build() {
    getAllToDo();
    return [];
  }

  final todoRepo = Todorepository();

  void getAllToDo() async {
    final todos = await todoRepo.getToDos();
    state = todos ?? [];
  }

  Future<ToDoEntity?> addTodo({required ToDoEntity todo}) async {
    try {
      if (todo.id.isEmpty) {
        final docId = FirebaseFirestore.instance.collection('todos').doc().id;
        final newTodo = todo.copyWith(id: docId);
        await todoRepo.addToDo(todo: newTodo);
        state = [...state, newTodo];
        return newTodo;
      } else {
        // 기존 할 일 수정
        await todoRepo.updateToDo(todo: todo);

        state = state.map((t) {
          if (t.id == todo.id) {
            return todo;
          } else {
            return t;
          }
        }).toList();
        return todo;
      }
    } catch (e) {
      print('할 일 저장 실패: $e');
      return null;
    }
  }

  void toggleFavorite({required String id, required bool isFavorite}) {}

  void toggleDone({required String id, required bool isDone}) {}

  void deleteTodo({required String id}) {}
}

final homeViewModel = NotifierProvider<HomeViewModel, List<ToDoEntity>>(() {
  return HomeViewModel();
});
