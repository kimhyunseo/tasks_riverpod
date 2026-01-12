import 'todo_entity.dart';

extension ToDoEntityFirestore on ToDoEntity {
  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('id');
    return json;
  }
}
