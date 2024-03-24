import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/table_name.dart';
part 'task_entity.g.dart';

@Entity(tableName: TableName.task)
@JsonSerializable()
class TaskEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? name;
  String? description;
  @ColumnInfo(name: 'created_at')
  @JsonKey(name: 'created_at')
  String? createdAt;
  @ColumnInfo(name: 'due_date')
  @JsonKey(name: 'due_date')
  String? dueDate;
  int? status;
  @ColumnInfo(name: 'is_pinned')
  @JsonKey(name: 'is_pinned')
  bool isPinned;

  TaskEntity({this.id, this.name, this.description, this.createdAt, this.dueDate, this.status, this.isPinned = false});

  factory TaskEntity.fromJson(Map<String, dynamic> json) => _$TaskEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);
}
