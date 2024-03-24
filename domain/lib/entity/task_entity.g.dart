// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) => TaskEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      dueDate: json['due_date'] as String?,
      status: json['status'] as int?,
      isPinned: json['is_pinned'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskEntityToJson(TaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt,
      'due_date': instance.dueDate,
      'status': instance.status,
      'is_pinned': instance.isPinned,
    };
