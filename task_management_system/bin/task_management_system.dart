import 'dart:io';
import 'task.dart';
import 'task_manager.dart';

void main() {
  TaskManager manager = TaskManager();
  bool isRunning = true;
  while(isRunning){
    print('1. Add new Task');
    print('2. Update Task Status');
    print('3. Get Task By Status');
    print('4. Show overdue Tasks');
    print('5. Exit the App');

    stdout.write('Select an Operation: ');
    String? operation = stdin.readLineSync();

    switch(operation){
      case '1':
        Task newTask = Task();
        // Take Title Input
        while(true){
           stdout.write('Enter Task Title: ');
           newTask.title = stdin.readLineSync();
           if(newTask.title!.length < 10){
             print('Title should be at least 10 character long');
           }else{
             break;
           }
        }
        // Take Description input
        while(true){
           stdout.write('Enter Task Description: ');
           newTask.description = stdin.readLineSync();
           if(newTask.description!.length < 20){
             print('Description should be at least 20 character long');
           }else{
             break;
           }
         }
        // Take Status input
        while(true){
           stdout.write('Enter the task status (pending, inProgress, completed): ');
           String? status = stdin.readLineSync();

           try{
             newTask.status = getStatusFromString(status!);
             break;
           }
           catch(error){
             print(error);
           }
         }
        // Take Due Date input
        while(true){
           stdout.write('Enter a Due Date (e.e., 2024-12-31) : ');

           try{
             newTask.dueDate = DateTime.parse(stdin.readLineSync()!);
             break;
           }catch(error){
             print('Invalid date format! Please use a valid format (e.g., yyyy-mm-dd)');
           }
         }

        manager.addNewTask(newTask);
        break;
      case '2':
        stdout.write('Enter task id: ');
        int? id;
        while(true){
          id = int.tryParse(stdin.readLineSync()!);
          if(id == null || id < 1){
            print('Enter a valid Integer ID');
          }else{
              break;
            }
        }
        // Take Status input
        TaskStatus newStatus;
        while(true){
          stdout.write('Enter the task new status (pending, inProgress, completed): ');
          String? status = stdin.readLineSync();

          try{
            newStatus = getStatusFromString(status!);
            break;
          }
          catch(error){
            print(error);
          }
        }

        manager.updateTaskStatus(id, newStatus);
        break;
      case '3':
        while(true){
          stdout.write('Enter the task status (pending, inProgress, completed): ');
          String? status = stdin.readLineSync();

          try{
            TaskStatus enumStatus = getStatusFromString(status!);
            var taskList = manager.getTaskByStatus(enumStatus);
            for(var task in taskList){
              print(task);
            }
            break;
          }
          catch(error){
            print('Error: $error');
          }
        }
        break;
      case '4':
        manager.showOverdueTask();
        break;
       case '5':
        isRunning = false;
        break;
      default:
        print('Select a Valid Operation');
    }
  }
}
