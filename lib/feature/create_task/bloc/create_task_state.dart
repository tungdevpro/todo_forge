import 'package:core/core.dart';

enum CreateTaskStatus {none, success, failure, validating}

class CreateTaskState extends BaseState {
  final CreateTaskStatus status;

  CreateTaskState({this.status = CreateTaskStatus.none});
  
  @override
  List<Object?> get props => [status];
  
}