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
  String? createdAt;
  String? dueDate;
  int? status;

  TaskEntity({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.dueDate,
    this.status,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);
}
