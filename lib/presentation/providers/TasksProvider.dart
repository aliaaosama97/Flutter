import 'package:flutter/material.dart';
import '../../Data/Model/TaskModel.dart';

class tasksProvider extends ChangeNotifier{
  List<TaskModel> tasks=[];

  AddNewTask(TaskModel task)
  {
    tasks.add(task);
    notifyListeners();
  }

  DeleteSelectedTask( int index)
  {
    print(index);
    tasks.removeAt(index);
    notifyListeners();
  }

  DeleteByValue(TaskModel selectedTask)
  {
    //print(index);
    tasks.remove(selectedTask);
    notifyListeners();
  }

  EditSelectedTask()
  {
    //selectedTask.
    notifyListeners();
  }
}