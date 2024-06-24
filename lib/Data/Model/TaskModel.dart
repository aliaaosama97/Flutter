
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../core/Methods.dart';

class TaskModel {

  String description;
  String taskName;
  String? assignedPerson;
  bool gps;
  late String startDate;
  late String? endDate;

  ColorLabel priority;
  ColorLabelProgress progress;

  var now = new DateTime.now();
  var formatter = new DateFormat.yMMMd();

  TaskModel({required this.description,this.priority = ColorLabel.red, required this.taskName, this.progress = ColorLabelProgress.red,
    this.gps = false,this.endDate =""
  }){
    this.startDate = formatter.format(now);
  }
}