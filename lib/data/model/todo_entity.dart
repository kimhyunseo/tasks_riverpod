import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
abstract class ToDoEntity with _$ToDoEntity {
  const factory ToDoEntity({
    required String id,
    required String title,
    String? description,
    @Default(false) bool isFavorite,
    @Default(false) bool isDone,
    required DateTime createdAt,
  }) = _ToDoEntity;

  factory ToDoEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoEntityFromJson(json);
}
