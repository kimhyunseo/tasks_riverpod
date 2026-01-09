// ignore_for_file: avoid_print

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

  void toggleFavorite({required String id, required bool isFavorite}) async {
    try {
      // 해당 todo 찾기
      final todo = state.firstWhere((t) => t.id == id);

      // 전달받은 isFavorite 값으로 업데이트
      final updatedTodo = todo.copyWith(isFavorite: isFavorite);

      // 서버 업데이트
      await todoRepo.updateToDo(todo: updatedTodo);

      // 상태 업데이트
      state = state.map((t) => t.id == id ? updatedTodo : t).toList();
    } catch (e) {
      print('즐겨찾기 실패: $e');
    }
  }

  void toggleDone({required String id, required bool isDone}) async {
    try {
      final todo = state.firstWhere((t) => t.id == id);
      final updatedTodo = todo.copyWith(isDone: isDone);

      await todoRepo.updateToDo(todo: updatedTodo);

      state = state.map((t) => t.id == id ? updatedTodo : t).toList();
    } catch (e) {
      print('완료 실패: $e');
    }
  }

  Future<void> deleteTodo({required String id}) async {
    try {
      await todoRepo.deleteToDo(id);

      state = state.where((t) => t.id != id).toList();
    } catch (e) {
      print('할 일 삭제 실패: $e');
    }
  }
}

final homeViewModel = NotifierProvider<HomeViewModel, List<ToDoEntity>>(() {
  return HomeViewModel();
});
