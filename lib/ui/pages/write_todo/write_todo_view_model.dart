import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/data/model/todo_entity.dart';
import 'package:tasks/data/repository/todo_repository.dart';

class WriteState {
  bool isWriting;
  WriteState(this.isWriting);
}

class WriteTodoViewModel extends Notifier<WriteState> {
  final ToDoEntity? arg;

  WriteTodoViewModel(this.arg);

  @override
  WriteState build() {
    return WriteState(false);
  }

  Future<void> addToDo({required String id, required String title}) async {
    state = WriteState(true);
    final todoRepo = Todorepository();

    if (arg == null) {
      final todos = await todoRepo.addToDo(ToDoEntity(id: id, title: title));
      state = WriteState(false);
      return todos;
    } else {
      final todos = await todoRepo.updateToDo(ToDoEntity(id: id, title: title));
      state = WriteState(false);
      return todos;
    }
  }
}

final writeTodoViewModel = NotifierProvider.autoDispose
    .family<WriteTodoViewModel, WriteState, ToDoEntity?>((arg) {
      return WriteTodoViewModel(arg);
    });
