import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:taskawi_flutter/Data/Model/TaskModel.dart';
import '../../../core/Methods.dart';
import 'package:taskawi_flutter/core/Constants.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import '../../Models/CustomDropDownStates.dart';
import '../../Models/CustomDropDownPriority.dart';
import '../../Models/CustomTextFiled.dart';
import '../../providers/TasksProvider.dart';
import '../AddNewTask/GPS.dart';
import 'Attached.dart';

class HomeEdit extends StatefulWidget {
  final void Function() ontapEdit;
  final void Function() ontapEditClose;
  final void Function() ontapMilestone;
  final void Function() ontapAttachments;
  final void Function() ontapHome;
  final bool editPress_check;
  final bool deletePress_check;
  final Color edit_focusColor;
  final Color edit_color;
  final bool milestoneCheck;
  final  int EditIconIndex;
  final TaskModel selectedTaskData;
  const HomeEdit({super.key, required this.ontapEdit,
    required this.ontapMilestone,
    required this.edit_focusColor, required this.deletePress_check,
    required this.editPress_check,
    required this.ontapEditClose,
    required this.edit_color,
    required this.ontapHome,
    required this.EditIconIndex,
    required this.milestoneCheck, required this.ontapAttachments,
    required this.selectedTaskData
  });

  @override
  State<HomeEdit> createState() => _HomeEditState();
}

class _HomeEditState extends State<HomeEdit> {

  List<DateTime?> _datesStart =[];
  List<DateTime?> _datesEnd =[];
  TextEditingController textDateStart = TextEditingController(text: '20/01/2024');
  TextEditingController textDateEnd = TextEditingController(text: '25/01/2024');

  //the priority dropdown box
  final TextEditingController colorController = TextEditingController();
  ColorLabel? selectedColor;
  //statues dropdown box
  ColorLabelProgress? StatuesSelectedColor;
  final TextEditingController StatuescolorController = TextEditingController();

  //Icons of the Attachments
  List<IconData> EdittsIcon =[Icons.edit_outlined, Icons.edit];
  //add animation button
  ScrollController _scrollController = ScrollController();


  //in put data will be removed later
  TextEditingController text1 = TextEditingController(text: 'this task need...');
  TextEditingController text2 = TextEditingController(text: '');
  TextEditingController text3 = TextEditingController(text: 'Loubna Mohamed');
  TextEditingController text4 = TextEditingController(text: '1956');
  TextEditingController text5 = TextEditingController(text: 'Ali Hany');


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<tasksProvider>(context);
    return Padding(
      padding: REdgeInsets.only(left: 18.0,right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //
          Expanded(
            child: ListView(
              children: [
                //SizedBox(height: 10,),

                //Description
                CustomTextFiled(topPadding: 10, textControler: TextEditingController(text: widget.selectedTaskData.description),
                  keyboardType: TextInputType.multiline,
                  hintText: StringsManager().DescriptionHint, labelText: StringsManager().DescriptionLabel,
                  border:  OutlineInputBorder(),readonly: !widget.editPress_check,focus:  widget.editPress_check,
                ),

                //PRIORITY Part
                dropdown(topPadding: 30,colorL: widget.selectedTaskData.priority,controller: colorController,label:Text('priority',),
                  initialSelection: widget.selectedTaskData.priority,ignor: !widget.editPress_check,
                  onselected: (ColorLabel? color) {
                    setState(() {
                      selectedColor = color;
                      widget.selectedTaskData.priority= selectedColor!;
                    });
                  },
                ),

                //Assigned person & Task ID
                CustomTextFiled(topPadding: 10.0,keyboardType: TextInputType.text,textControler: text3,focus: widget.editPress_check,
                    hintText: StringsManager().NameHint, labelText: StringsManager().AssignedPersonLabel,
                    readonly: !widget.editPress_check),

                CustomTextFiled(topPadding: 10.0,keyboardType: TextInputType.text,textControler: text4,focus: widget.editPress_check,
                    hintText: StringsManager().NameHint, labelText: StringsManager().TaskIdLabel,
                    readonly: !widget.editPress_check),

                //START & END Date Part
                //start
                CustomTextFiled(topPadding: 30.0, textControler: TextEditingController(text: widget.selectedTaskData.startDate),keyboardType: TextInputType.multiline,
                  hintText: StringsManager().hintTextDate, labelText: StringsManager().EndDateLabel,
                  border:  OutlineInputBorder(),readonly: true,focus:  widget.editPress_check,
                  icon: Icon(Icons.calendar_month,color: Theme.of(context).colorScheme.onBackground,),
                  ontap: (){
                    //to put the value in the textfiled and then reset the screan
                    if(widget.editPress_check == true) {
                      chooseDate(_datesStart, context).then((
                          value) {
                        _datesStart = value ?? [];
                        textDateStart.text =
                            _datesStart.toString();
                        setState(() {

                        });
                      });
                    }
                  },
                ),

                //end
                CustomTextFiled(topPadding: 30.0, textControler: TextEditingController(text: widget.selectedTaskData.endDate),
                  keyboardType: TextInputType.multiline,
                  hintText: StringsManager().hintTextDate, labelText: StringsManager().EndDateLabel,
                  border:  OutlineInputBorder(),readonly: true,focus:  widget.editPress_check,
                  icon: Icon(Icons.calendar_month,color: Theme.of(context).colorScheme.onBackground,),
                  ontap: (){
                    if(widget.editPress_check == true) {
                      chooseDate(_datesEnd, context).then((
                          value) {
                        _datesEnd = value ?? [];
                        textDateEnd.text =
                            _datesEnd.toString();
                        setState(() {

                        });
                      });
                    }
                  },
                ),

                //Created by person
                CustomTextFiled(topPadding: 10.0,keyboardType: TextInputType.text,textControler: text5,
                    hintText: StringsManager().NameHint, labelText: StringsManager().CreatedBy,
                  readonly: true,focus:  !widget.editPress_check,
                  icon: Icon(Icons.person,color: Theme.of(context).colorScheme.onBackground,),

                ),

                //GPS Part and send the font of the start and end zones
                GPS(font: 12,check_Edit_or_Add: widget.editPress_check,gpsData: widget.selectedTaskData.gps, ),

                //Task Statues
                CustomDropDownStates(topPadding: 30,colorL: widget.selectedTaskData.progress,controller: StatuescolorController,label:Text('Task Statues'),
                  initialSelection: widget.selectedTaskData.progress,ignor: !widget.editPress_check,
                  onselected: (ColorLabelProgress? color) {
                    setState(() {
                      StatuesSelectedColor = color;
                      widget.selectedTaskData.progress= StatuesSelectedColor!;
                    });
                  },
                ),


              ],
            ),
          ),

          //Edit, Attach and milestone buttons
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(
                top: 20.0, left: 0.0, right: 0.0),
            child: Column(
              children: [
                //Attachments
                IconButton(onPressed: (){
                  widget.ontapAttachments();
                },
                  icon:  Icon(Icons.photo_library_outlined,
                    size: 25.sp,
                    color: AppColors.editIconColorRed,
                  ),
                ),

                //Milestone
                IconButton(onPressed: (){
                  widget.ontapMilestone();
                },
                  icon:  Icon(Icons.flag_outlined,
                    size: 25.sp,
                    color: AppColors.editIconColorRed,),),

                //Edit
                IconButton(onPressed: (){
                  _dialogBuilder(context,'Edit Task', 'Would you like to edit this task',(){
                    widget.ontapEdit();
                    setState(() {
                      toastMessage('EDIT Task ON', 'Know you can edit the task',context);
                    });
                    Navigator.of(context).pop();
                  },(){
                    widget.ontapEditClose();
                    setState(() {
                      //toastMessage('EDIT Task OFF', 'you exit the edit mood',context);
                    });
                    Navigator.of(context).pop();
                  });
                  print('turned ${(widget.editPress_check) ? 'on' : 'off'}');
                },
                  icon:  Icon(EdittsIcon[widget.EditIconIndex],
                    size: 25.sp,
                    color: widget.edit_color,),),

                //Delete
                IconButton(onPressed: (){
                  tasks.DeleteByValue(widget.selectedTaskData);
                  _dialogBuilder(context,'Delete Task', 'Are you sure you want to delete this task?',(){
                    Navigator.pushNamed(context, '/home');
                    setState(() {
                      toastMessage('Deleted', 'The task has been deleted',context);
                    });
                    //delete the task from the jason file
                  },(){
                    //widget.selectedTaskData.
                    Navigator.of(context).pop();
                  });

                },
                  icon:  Icon(Icons.delete_outline,
                    size: 25.sp,
                    color: AppColors.editIconColorRed,),),

              ],
            ),
          ),


        ],
      ),

    );
  }


  //popup Delete/Edit dialog
  Future<void> _dialogBuilder(BuildContext context, String title_Text, String main_Text, void Function() press_yes, void Function() press_cancel) {

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title_Text),
          content: Text(
            main_Text,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: press_cancel,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: press_yes,
            ),
          ],
        );
      },
    );
  }
}
