import 'task.dart';

class TaskManager{
  late final List<Task> _taskList = [];

  void addNewTask(Task newTask) {
    _taskList.add(newTask);
    print('\nTask Added Successfully\n\n');
  }

  updateTaskStatus(int id, TaskStatus newStatus) {
    int index = _taskList.indexWhere((task) => task.id == id);

    if (index >= 0){
      _taskList[index].status = newStatus;
    }
    print('${_taskList[index].id} Updated. New Status ${_taskList[index].status}');
  }

  getTaskByStatus(TaskStatus status) {
    var taskList = _taskList
        .where((task)=> task.status == status)
        .map((task)=>{
              'id': task.id,
              'title': task.title,
              'description': task.description,
              'status': task.status,
              'dueDate': task.dueDate,
            })
        .toList();

    return taskList;
  }

  showOverdueTask() {
    var overDueTasks = _taskList
        .where((task) => task.dueDate != null && task.dueDate!.isBefore(DateTime.now()))
        .map((task) => {
          'id': task.id,
          'title': task.title,
          'description': task.description,
          'status': task.status,
          'dueDate': task.dueDate
    })
    ;
    if(overDueTasks.isEmpty){
      print('No Overdue Task');
    }else{
      print(overDueTasks);
    }
  }
}