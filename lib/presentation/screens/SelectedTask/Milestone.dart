import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import 'package:taskawi_flutter/core/Constants.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../core/Methods.dart';
import '../../Models/CustomDottedBorderMA.dart';
import '../../Models/CustomListview.dart';
import '../../Models/CustomTextFiled.dart';
import 'Attached.dart';


class Milestone extends StatefulWidget {
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
  const Milestone({super.key,required this.ontapEdit,
    required this.edit_focusColor, required this.deletePress_check,
    required this.editPress_check,
    required this.ontapEditClose,
    required this.ontapHome,
    required this.edit_color,
    required this.milestoneCheck,
    required this.ontapMilestone,
    required this.ontapAttachments
  });

  @override
  State<Milestone> createState() => _MilestoneState();
}

class _MilestoneState extends State<Milestone> {

  TextEditingController text1 = TextEditingController(text: 'Please copy and past everything');
  //Icons of the Milestones
  List<IconData> MilestoneIcon =[Icons.flag_outlined, Icons.flag];
  int MilestoneIconIndex = 1;
  int addedMileston =0;

  //Icons of the Attachments
  List<IconData> AttachmentsIcon =[Icons.photo_library_outlined, Icons.photo_library_rounded];
  int AttachmentsIconIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.r), topRight: Radius.circular(0.r)),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      height: double.infinity,
      width: double.infinity,
      child:  Padding(
        padding: REdgeInsets.only(left: 18.0,right: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: dottedBorder(text: "Add Milestone",
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
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomListview(addedMileston: addedMileston,top: 10,hintText: StringsManager().milestoneHint ,
                        labelText: StringsManager().milestone),
                  ),
                ],
              ),
            ),


            //Edit,Home, Attach and milestone buttons
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
                    icon:  Icon(AttachmentsIcon[AttachmentsIconIndex],
                      size: 25.sp,
                      color: AppColors.editIconColorRed,
                    ),
                  ),

                  //Milestone
                  IconButton(onPressed: (){

                  },
                    icon:  Icon(MilestoneIcon[MilestoneIconIndex],
                      size: 25.sp,
                      color: AppColors.editIconColorRed,),),

                  //Home
                  IconButton(onPressed: (){
                    widget.ontapHome();
                  },
                    icon:  Icon(Icons.home_outlined,
                      size: 25.sp,
                      color: AppColors.editIconColorRed,
                    ),
                  ),

                ],
              ),
            ),


          ],
        ),

      ),


    );
  }
}
