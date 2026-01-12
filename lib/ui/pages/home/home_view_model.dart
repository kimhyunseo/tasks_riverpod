// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/data/model/todo_entity.dart';
import 'package:tasks/data/repository/todo_repository.dart';

class HomeViewModel extends Notifier<List<ToDoEntity>> {
  @override
  List<ToDoEntity> build() {
    fetch();
    return [];
  }

  final todoRepo = TodoRepository();

  /// 모든 할 일 가져오기
  Future<void> fetch() async {
    final todos = await todoRepo.getToDos();
    state = todos ?? [];
  }

  /// 할 일 저장
  Future<ToDoEntity?> saveTodo({required ToDoEntity todo}) async {
    try {
      final docId = FirebaseFirestore.instance.collection('todos').doc().id;
      final newTodo = todo.copyWith(id: docId);
      await todoRepo.addToDo(todo: newTodo);
      state = [...state, newTodo];
      return newTodo;
    } catch (e) {
      print('할 일 저장 실패: $e');
      rethrow;
    }
  }

  Future<ToDoEntity?> editTodo({required ToDoEntity todo}) async {
    try {
      await todoRepo.updateToDo(todo: todo);
      state = state.map((t) {
        if (t.id == todo.id) {
          return todo;
        } else {
          return t;
        }
      }).toList();
      return todo;
    } catch (e) {
      print('할 일 수정 실패: $e');
      rethrow;
    }
  }

  /// 즐겨찾기 토글
  Future<void> toggleFavorite({
    required String id,
    required bool isFavorite,
  }) async {
    try {
      final todo = state.firstWhere((t) => t.id == id);
      final updatedTodo = todo.copyWith(isFavorite: isFavorite);
      await todoRepo.updateToDo(todo: updatedTodo);
      state = state.map((t) => t.id == id ? updatedTodo : t).toList();
    } catch (e) {
      print('즐겨찾기 실패: $e');
      rethrow;
    }
  }

  /// 완료 토글
  Future<void> toggleDone({required String id, required bool isDone}) async {
    try {
      final todo = state.firstWhere((t) => t.id == id);
      final updatedTodo = todo.copyWith(isDone: isDone);

      await todoRepo.updateToDo(todo: updatedTodo);

      state = state.map((t) => t.id == id ? updatedTodo : t).toList();
    } catch (e) {
      print('완료 실패: $e');
      rethrow;
    }
  }

  ///  할 일 삭제
  Future<void> deleteTodo({required String id}) async {
    try {
      await todoRepo.deleteToDo(id);

      state = state.where((t) => t.id != id).toList();
    } catch (e) {
      print('할 일 삭제 실패: $e');
      rethrow;
    }
  }
}

final homeViewModel = NotifierProvider<HomeViewModel, List<ToDoEntity>>(() {
  return HomeViewModel();
});
