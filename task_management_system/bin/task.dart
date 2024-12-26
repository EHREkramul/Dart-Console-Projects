enum TaskStatus {
  pending,
  inProgress,
  completed,
}

TaskStatus getStatusFromString(String status){
  switch(status){
    case 'pending': return TaskStatus.pending;
    case 'inProgress': return TaskStatus.inProgress;
    case 'completed': return TaskStatus.completed;
    default: throw ArgumentError('Invalid Status. Enter (pending, inProgress, completed)');
  }
}
class Task{
  Task(): id = _getNextId();
  static int _getNextId(){
    _lastId++;
    return _lastId;
  }
  static int _lastId = 0;


  final int id;
  String? title;
  String? description;
  TaskStatus? status;
  DateTime? dueDate;
}