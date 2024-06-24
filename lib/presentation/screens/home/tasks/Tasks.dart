import 'package:flutter/material.dart';
import 'package:taskawi_flutter/Data/Model/TaskModel.dart';
import 'package:taskawi_flutter/presentation/screens/SelectedTask/SelectedTask.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/Methods.dart';



class Tasks extends StatefulWidget {
  final void Function(BuildContext) ondelete;
  final TaskModel task;
  const Tasks({super.key,required this.ondelete,required this.task});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  //change the color of the flag and card dependes on the paiorety
  var CardColorPaiorety = Colors.green;

  //PRIORITY tracking
  Color? PriortySelectedColor = Colors.red;
  var prioritySelectedType = "HIGH PRIORITY";


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/task',arguments: widget.task);
      },
      child: Slidable(
        startActionPane: ActionPane(motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: widget.ondelete,
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

        ]),
        child: Card(
          elevation: 6.0,
          color: widget.task.progress.color,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        
          child: Container(
            //height: 200,
            width: MediaQuery.of(context).size.width,
            margin:  EdgeInsets.only(left: 10),
            decoration:  BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
        
                Column(
                  children: [
                    ListTile(
                      trailing: Icon(
                        Icons.expand_more_rounded,
                        size: 25.sp,
                      ),
                      leading: Icon(
                        Icons.track_changes_rounded,
                        color: widget.task.progress.color,
                        size: 40.sp,
                      ),
                      title: Row(
                        children: [
                          Text(
                            widget.task.taskName,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      subtitle: Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.task.description,
                            style: TextStyle(fontSize: 16),
                          ),
        
                          const Divider(
                            height: 20,
                            thickness: 1,
                            indent: 0,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Icon(Icons.priority_high, color: widget.task.priority.color),
                              Text(
                                widget.task.priority.label,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
        
                    ),
        
                  ],
        
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
