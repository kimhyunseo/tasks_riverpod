// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToDoEntity {

 String get id; String get title; String? get description; bool get isFavorite; bool get isDone;
/// Create a copy of ToDoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToDoEntityCopyWith<ToDoEntity> get copyWith => _$ToDoEntityCopyWithImpl<ToDoEntity>(this as ToDoEntity, _$identity);

  /// Serializes this ToDoEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToDoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isFavorite,isDone);

@override
String toString() {
  return 'ToDoEntity(id: $id, title: $title, description: $description, isFavorite: $isFavorite, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class $ToDoEntityCopyWith<$Res>  {
  factory $ToDoEntityCopyWith(ToDoEntity value, $Res Function(ToDoEntity) _then) = _$ToDoEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, bool isFavorite, bool isDone
});




}
/// @nodoc
class _$ToDoEntityCopyWithImpl<$Res>
    implements $ToDoEntityCopyWith<$Res> {
  _$ToDoEntityCopyWithImpl(this._self, this._then);

  final ToDoEntity _self;
  final $Res Function(ToDoEntity) _then;

/// Create a copy of ToDoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? isFavorite = null,Object? isDone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ToDoEntity].
extension ToDoEntityPatterns on ToDoEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToDoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToDoEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToDoEntity value)  $default,){
final _that = this;
switch (_that) {
case _ToDoEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToDoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ToDoEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  bool isFavorite,  bool isDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToDoEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  bool isFavorite,  bool isDone)  $default,) {final _that = this;
switch (_that) {
case _ToDoEntity():
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  bool isFavorite,  bool isDone)?  $default,) {final _that = this;
switch (_that) {
case _ToDoEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isFavorite,_that.isDone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToDoEntity implements ToDoEntity {
  const _ToDoEntity({required this.id, required this.title, this.description, this.isFavorite = false, this.isDone = false});
  factory _ToDoEntity.fromJson(Map<String, dynamic> json) => _$ToDoEntityFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  bool isDone;

/// Create a copy of ToDoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToDoEntityCopyWith<_ToDoEntity> get copyWith => __$ToDoEntityCopyWithImpl<_ToDoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToDoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToDoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,isFavorite,isDone);

@override
String toString() {
  return 'ToDoEntity(id: $id, title: $title, description: $description, isFavorite: $isFavorite, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$ToDoEntityCopyWith<$Res> implements $ToDoEntityCopyWith<$Res> {
  factory _$ToDoEntityCopyWith(_ToDoEntity value, $Res Function(_ToDoEntity) _then) = __$ToDoEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, bool isFavorite, bool isDone
});




}
/// @nodoc
class __$ToDoEntityCopyWithImpl<$Res>
    implements _$ToDoEntityCopyWith<$Res> {
  __$ToDoEntityCopyWithImpl(this._self, this._then);

  final _ToDoEntity _self;
  final $Res Function(_ToDoEntity) _then;

/// Create a copy of ToDoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? isFavorite = null,Object? isDone = null,}) {
  return _then(_ToDoEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
