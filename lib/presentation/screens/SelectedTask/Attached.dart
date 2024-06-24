import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskawi_flutter/core/Colors.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../core/Methods.dart';
import '../../Models/CustomDottedBorderMA.dart';

class Attached extends StatefulWidget {
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
  const Attached({super.key,required this.ontapEdit,
    required this.edit_focusColor, required this.deletePress_check,
    required this.editPress_check,
    required this.ontapHome,
    required this.ontapEditClose,
    required this.edit_color,
    required this.milestoneCheck,
    required this.ontapMilestone,required this.ontapAttachments});

  @override
  State<Attached> createState() => _AttachedState();
}

class _AttachedState extends State<Attached> {

  TextEditingController text1 = TextEditingController(text: 'Please copy and past everything');
  Color _iconColor = Colors.transparent;

  // image pic
  final ImagePicker picker = ImagePicker();
  // Pick multiple images.
  List<XFile> SelectedImages =[];


  //Icons of the Attachments
  List<IconData> AttachmentsIcon =[Icons.attach_file_sharp, Icons.photo_library];
  int AttachmentsIconIndex = 1;
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
                    child: dottedBorder(text: "Select Files",
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
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView(
                      children: [
                        //Milestone
              
              
              
                      ],
                    ),
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
                    setState(() {
                      //_iconColor = Colors.yellow;
                    });
                  },
                    icon:  Icon(AttachmentsIcon[AttachmentsIconIndex],
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
                      color:AppColors.editIconColorRed,),),

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


    );;
  }
}
