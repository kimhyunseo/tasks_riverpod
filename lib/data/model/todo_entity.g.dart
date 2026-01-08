// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoEntity _$ToDoEntityFromJson(Map<String, dynamic> json) => _ToDoEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  isFavorite: json['isFavorite'] as bool? ?? false,
  isDone: json['isDone'] as bool? ?? false,
);

Map<String, dynamic> _$ToDoEntityToJson(_ToDoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isFavorite': instance.isFavorite,
      'isDone': instance.isDone,
    };
