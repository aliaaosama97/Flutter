import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:taskawi_flutter/Data/Model/TaskModel.dart';
import 'package:taskawi_flutter/presentation/screens/SelectedTask/Attached.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import 'package:taskawi_flutter/presentation/screens/SelectedTask/Milestone.dart';
import 'package:provider/provider.dart';
import '../../../core/Methods.dart';
import '../../Models/CustomAppBar.dart';
import '../../Models/CustomScrollingFabAnimatedButton.dart';
import '../../providers/TasksProvider.dart';
import '../AddNewTask/GPS.dart';
import 'HomeEdit.dart';
import 'package:taskawi_flutter/core/Constants.dart';
import 'Milestone.dart';

class SelectedTask extends StatefulWidget {
  //final taskModel task;
  const SelectedTask({super.key});

  @override
  State<SelectedTask> createState() => _SelectedTaskState();
}

class _SelectedTaskState extends State<SelectedTask> {

  String TaskName = 'Task Name';



  //bool to check if its edit/Delete mode or not
  bool editPress_check = false;
  bool started_check = false;
  int EditIconIndex = 0;
  bool deletePress_check = false;
  //color of the edit icon & delete
  Color edit_color = Color(0xffB81736);
  Color edit_focusColor = Colors.transparent;
  
  //bool to check if he press milestone or not 
  bool milestoneCheck = false;
  //bool to check if the attachments is pressed or not
  bool attachmentCheck = false;

  //add animation button
  ScrollController _scrollController = ScrollController();
  //selected task from the pushed arrgument


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var selectedTaskData = ModalRoute.of(context)!.settings.arguments as TaskModel;
    var provider = Provider.of<tasksProvider>(context);
    return Scaffold(
        floatingActionButton:  editPress_check == true ? Visibility(
          visible: editPress_check,
          child: CustomScrollingFabAnimatedButton(icon: Icon(Icons.save_alt, color: AppColors.textFormFieldColor,),
            width: 110.w,height: 55.h,radius: 20.0.r,tittle: 'save',scroll: _scrollController,onPress: (){
              edit_focusColor = Colors.transparent;
              editPress_check = false;
              EditIconIndex = 0;
              provider.EditSelectedTask();
              setState(() {
                toastMessage('Saved ', 'The Edite information is Saved',context);
              });
            },
          ),
        )
        :  started_check == false? CustomScrollingFabAnimatedButton(icon: Icon(Icons.play_circle_outline, color: AppColors.textFormFieldColor,),
          width: 140.w,height: 55.h,radius: 20.0.r,tittle: 'Start Task',scroll: _scrollController,onPress: (){
            selectedTaskData.progress = ColorLabelProgress.green;
            started_check = true;
            provider.EditSelectedTask();
            setState(() {
              toastMessage('Started ', 'You started the task',context);
            });
          },
        )
        : CustomScrollingFabAnimatedButton(icon: Icon(Icons.done_outline, color: AppColors.textFormFieldColor,),
          width: 140.w,height: 55.h,radius: 20.0.r,tittle: 'Finish Task',scroll: _scrollController,onPress: (){
            selectedTaskData.progress = ColorLabelProgress.blue;
            Navigator.pushNamed(context, '/home');
            started_check = true;
            provider.EditSelectedTask();
            setState(() {
              toastMessage('Finished ', 'You started the task',context);
            });
          },
        ),
        appBar: CustomAppBar(DefultTitle:selectedTaskData.taskName),
        body: milestoneCheck == false && attachmentCheck == false? HomeEdit(EditIconIndex: EditIconIndex,
          selectedTaskData: selectedTaskData,
          //Home
          ontapHome: (){

          },
          //Edit
          ontapEdit:(){
            editPress_check = true;
            EditIconIndex = 1;
            edit_focusColor = Colors.black12;
            setState(() {

            });
          } ,
          ontapEditClose: (){
            edit_color = Color(0xffB81736);
            edit_focusColor =Colors.transparent;
            editPress_check = false;
            EditIconIndex = 0;
            setState(() {

            });
          },

          //Milestone
          ontapMilestone: (){
            milestoneCheck = true;
            print("you are on the Milestone");
            setState(() {

            });
          },
          //Attachments
          ontapAttachments: (){
            attachmentCheck = true;
            print("you are on the Attachments");
            setState(() {

            });
          },
          //highlight edit color change
          edit_focusColor: edit_focusColor,
          //delete
          deletePress_check: deletePress_check,
          //edit Bool & milestone
          edit_color: edit_color,editPress_check: editPress_check,milestoneCheck: milestoneCheck,)

            :  milestoneCheck == true && attachmentCheck == false?Milestone(
          ontapHome: (){
            attachmentCheck = false;
            milestoneCheck = false;
            print("you are on the Home");
            setState(() {

            });

          },
          //attachment
          ontapAttachments: (){
            attachmentCheck = true;
            milestoneCheck = false;
            print("you are on the attachment");
            setState(() {

            });
          }
          ,ontapEdit: (){},ontapEditClose: (){},
          ontapMilestone: (){
          },
          edit_focusColor: edit_focusColor,deletePress_check: deletePress_check,
          edit_color: edit_color,editPress_check: editPress_check,milestoneCheck: milestoneCheck, )

            : Attached(
            ontapHome: (){
              attachmentCheck = false;
              milestoneCheck = false;
              print("you are on the Home");
              setState(() {

              });

            },
            ontapEdit: (){}, edit_focusColor: edit_focusColor,
            deletePress_check: deletePress_check, editPress_check: editPress_check,
            ontapEditClose: (){},
            edit_color: edit_color,
            //Milestone
            milestoneCheck: milestoneCheck,
            ontapMilestone: (){

              milestoneCheck =true;
              attachmentCheck = false;
              print("you are on the Milestone");
              //milestoneCheck?milestoneCheck=false:milestoneCheck=true;
              setState(() {

              });
            },
            //Attachment
            ontapAttachments: (){

              print("you are on the Attachments");
              attachmentCheck?attachmentCheck=true:attachmentCheck=false;
              setState(() {

              });
            }),
    );
  }





}
