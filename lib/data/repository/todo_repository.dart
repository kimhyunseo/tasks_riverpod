import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/data/model/todo_entity.dart';

class Todorepository {
  //  할 일 목록 보기
  Future<List<ToDoEntity>?> getToDos() async {
    //
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('todos');
      final result = await collectionRef.get();

      final docs = result.docs;
      return docs.map((doc) {
        final map = doc.data();
        final newMap = {'id': doc.id, ...map};
        return ToDoEntity.fromJson(newMap);
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 할 일 1개 보기
  Future<ToDoEntity?> getOneToDo(String id) async {
    //
    return null;
  }

  //  할 일 추가
  Future<void> addToDo(ToDoEntity todo) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('todos');
    final docRef = collectionRef.doc();
    await docRef.set(todo.toJson());
  }

  //  할 일 수정
  Future<void> updateToDo(ToDoEntity todo) async {
    //
  }

  //  할 일 삭제
  Future<void> daleteToDo(String id) async {
    //
  }
}
