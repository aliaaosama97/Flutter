import 'dart:ffi';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:taskawi_flutter/Data/Model/TaskModel.dart';
import 'package:taskawi_flutter/presentation/Models/CustomDropDownPriority.dart';
import 'package:taskawi_flutter/presentation/Models/CustomTextFiled.dart';
import 'package:taskawi_flutter/presentation/providers/TasksProvider.dart';
import 'package:taskawi_flutter/presentation/screens/AddNewTask/GPS.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/Methods.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import 'package:taskawi_flutter/core/Constants.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../Models/CustomAppBar.dart';
import '../../Models/CustomDottedBorderMA.dart';
import '../../Models/CustomListview.dart';
import '../../Models/CustomScrollingFabAnimatedButton.dart';


class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}
//the priority dropdown box


class _AddNewTaskState extends State<AddNewTask> {

  //the appbar title
  String DefultTitle = 'Create A New Task';
  bool Location = false;

  final _formKey = GlobalKey<FormState>();
  //the paiorety dropdown box
  final TextEditingController colorController = TextEditingController();
  ColorLabel? selectedColor;

  // image pic
  final ImagePicker picker = ImagePicker();
  // Pick multiple images.
  List<XFile> SelectedImages =[];

  //date
  List<DateTime?> _datesStart =[];
  List<DateTime?> _datesEnd =[];
  TextEditingController textDateStart = TextEditingController();
  TextEditingController textDateEnd = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  TextEditingController taskNameControler = TextEditingController();
  //ColorLabel priority;
  ColorLabelProgress? progress;
  //add animation button
  ScrollController _scrollController = ScrollController();
  //add task
  TaskModel? task;

  var gpsData= false;
  int addedMileston= 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<tasksProvider>(context);
    return Scaffold(
        floatingActionButton: CustomScrollingFabAnimatedButton(icon: Icon(Icons.add, color: AppColors.textFormFieldColor,),
          width: 120.w,height: 55.h,radius: 20.0.r,tittle: 'Add',scroll: _scrollController,onPress: (){
            if(selectedColor != null && descriptionControler.text != "" && taskNameControler.text != "") {
              //progress.label = "Not started";
              task = TaskModel(description: descriptionControler.text, priority: selectedColor!,
                  taskName: taskNameControler.text,gps: gpsData);
            }
            else
            {
              if(descriptionControler.text != "" && taskNameControler.text != "")
              {
                task = TaskModel(description: descriptionControler.text,
                    taskName: taskNameControler.text,gps: gpsData);
              }
              else
              {
                toastMessage('Empty Filed', 'please enter the Task Name & Task Description',context);
              }

            }
            if(task != null)
            {
              provider.AddNewTask(task!);
              Navigator.pushNamed(context, '/home');
            }
          },
        ),
      appBar:  CustomAppBar(DefultTitle:DefultTitle),
      body: Form(
        key: _formKey,
        child: Container(
            padding: EdgeInsets.all(20.0),
            child: Container(
              child: Form(
                child: ListView(
                  controller: _scrollController,
                  children: <Widget>[
                    //TASK Name & Description Part
                    //task name
                    CustomTextFiled(topPadding: 0.0, textControler: taskNameControler,keyboardType: TextInputType.text,
                        hintText: StringsManager().NameHint, labelText: StringsManager().TaskName),

                    //Description
                    CustomTextFiled(topPadding: 10.0, textControler: descriptionControler,keyboardType: TextInputType.multiline,
                        hintText: StringsManager().DescriptionHint, labelText: StringsManager().DescriptionLabel,
                      border:  OutlineInputBorder(),
                    ),


                    //Assigned PERSON Part
                    CustomTextFiled(topPadding: 10.0,keyboardType: TextInputType.text,
                        hintText: StringsManager().NameHint, labelText: StringsManager().AssignedPersonLabel,
                      icon: Icon(Icons.person,color: Theme.of(context).colorScheme.onBackground,),
                    ),


                    //PRIORITY Part
                    dropdown(topPadding: 30,colorL: selectedColor,controller: colorController,label:Text('priority',),
                      onselected: (ColorLabel? color){
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    ),

                    //GPS Part
                    GPS(font: 12, check_Edit_or_Add: true,gpsData: gpsData,gpsState: (bool state){
                      gpsData =state;
                      setState(() {

                      });
                    }),

                    //START & END Date Part
                    //start
                    CustomTextFiled(topPadding: 30.0, textControler: textDateStart,keyboardType: TextInputType.multiline,
                      hintText: StringsManager().DescriptionHint, labelText: StringsManager().DescriptionLabel,
                      border:  OutlineInputBorder(),readonly: true,
                      icon: Icon(Icons.calendar_month,color: Theme.of(context).colorScheme.onBackground,),
                      ontap: (){
                        //to put the value in the textfiled and then reset the screan
                        chooseDate(_datesStart, context).then((value) {
                          if(value!= null)
                          {

                          _datesStart = value?? [];
                          textDateStart.text =_datesStart!= null && _datesStart.isNotEmpty?
                          DateFormat.yMMMd().format(_datesStart[0]!) :"";
                          setState(() {

                          });
                          }
                        });
                      },
                    ),

                    //end
                    CustomTextFiled(topPadding: 30.0, textControler: textDateEnd,keyboardType: TextInputType.multiline,
                      hintText: StringsManager().DescriptionHint, labelText: StringsManager().DescriptionLabel,
                      border:  OutlineInputBorder(),readonly: true,
                      icon: Icon(Icons.calendar_month,color: Theme.of(context).colorScheme.onBackground,),
                      ontap: (){
                        //to put the value in the textfiled and then reset the screan
                        chooseDate(_datesEnd,context).then((value)  {
                          if(value != null)
                          {
                            _datesEnd = value?? [];
                            textDateEnd.text =_datesEnd!= null && _datesEnd.isNotEmpty?
                            DateFormat.yMMMd().format(_datesEnd[0]!) :"";
                            setState(() {

                            });
                          }


                        });
                      },
                    ),


                    //attachments & milestone
                    dottedBorder(text: "Select Files",
                      icon: Icon(Icons.add,
                        size: 50.sp,
                        color: AppColors.iconsColorsGray,), top: 35,
                      ontap: () async{
                        //pic one pic
                        //final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                        // Pick multiple images.
                        final List<XFile> images = await picker.pickMultiImage();
                        SelectedImages = images;
                        print("milestone Container clicked");
                      },
                    ),
                    dottedBorder(text: "Add Milestone",
                        icon: Icon(Icons.add,
                      size: 50.sp,
                      color: AppColors.iconsColorsGray,), top: 35,
                      ontap: (){
                        addedMileston++;
                        setState(() {

                        });
                        print("milestone Container clicked");
                      },
                    ),

                    CustomListview(addedMileston: addedMileston,top: 10,hintText: StringsManager().milestoneHint ,
                        labelText: StringsManager().milestone),

                    /*CustomTextFiled(topPadding: 30.0,keyboardType: TextInputType.multiline,
                      hintText: StringsManager().milestoneHint, labelText: StringsManager().milestone,
                      border:  OutlineInputBorder(),
                    ),*/

                  ],
                ),
              ),
            )),
      ),
    );
  }
}
