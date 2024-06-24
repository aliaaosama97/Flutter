import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:taskawi_flutter/presentation/providers/TasksProvider.dart';
import 'package:taskawi_flutter/presentation/screens/home/tasks/Tasks.dart';
import 'package:taskawi_flutter/presentation/screens/home/MonitoringTasks/Monitoring.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import 'package:taskawi_flutter/core/Constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../Data/Model/TaskModel.dart';
import '../../../../core/Methods.dart';
import '../../../Models/CustomScrollingFabAnimatedButton.dart';

class TasksDefaultPage extends StatefulWidget {
  const TasksDefaultPage({super.key});

  @override
  State<TasksDefaultPage> createState() => _TasksDefaultPageState();
}

class _TasksDefaultPageState extends State<TasksDefaultPage> with TickerProviderStateMixin {

  List<String> area_popup = StringsManager().area_popup;
  String DefultTitle = StringsManager().DefultTitle;
  // to differentiate between loading and no data
  bool isEmpty = false;
  //TabBar
  late final TabController _tabController;
  //add animation button
  ScrollController _scrollController = ScrollController();
  //lists of tasks


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<tasksProvider>(context);
    //var selectedTaskData = ModalRoute.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.iconsColorsWhite),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.onSecondary,
            ],
            ),
          ),
        ),
        title: Text('$DefultTitle', style: TextStyle(color: AppColors.textFormFieldColor),),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.task_sharp,color: AppColors.iconsColorsWhite,),
            ),
            Tab(
              icon: Icon(Icons.monitor, color: AppColors.iconsColorsWhite,),
            ),
          ],
        ),

        actions: [
          PopupMenuButton<String>(
            iconColor: AppColors.iconsColorsWhite,
            icon: Icon(Icons.filter_list_rounded),
            onSelected: (String value) {
              setState(() {
                // Update the selected item
                DefultTitle = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return area_popup.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          ),

        ],

      ),
      floatingActionButton: CustomScrollingFabAnimatedButton(icon: Icon(Icons.add, color: AppColors.textFormFieldColor,),
        height: 55.h,width: 140.w,radius: 20.0.r,tittle: 'New Task',scroll: _scrollController,onPress: (){
          Navigator.pushNamed(context, '/newtask');
        },
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          DefultTitle == 'All Tasks' ? ListView.builder(
            controller: _scrollController,
              itemBuilder: (context, index) => Tasks(ondelete: (context){
                tasks.DeleteSelectedTask(index);
                setState(() {

                });
                
              }, task: tasks.tasks![index]),
            itemCount: tasks.tasks?.length??0 ,
          )
              : ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) => Tasks(ondelete: (context){
              tasks.DeleteSelectedTask(index);
              setState(() {

              });

            }, task: tasks.tasks![index]),
            itemCount: tasks.tasks?.length??0 ,
          ),
          Monitoring(),
        ],
      ),
    );
  }
}
