import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/Constants.dart';
import 'CustomTextFiled.dart';

class CustomListview extends StatefulWidget {
  final int addedMileston;
  final double top;
  final String hintText;
  final String labelText;
  const CustomListview({super.key,required this.addedMileston,
    required this.top,required this.hintText,required this.labelText});

  @override
  State<CustomListview> createState() => _CustomListviewState();
}

class _CustomListviewState extends State<CustomListview> {


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Slidable(
        startActionPane: ActionPane(motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext){},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),

            ]),
        child: CustomTextFiled(topPadding: widget.top,keyboardType: TextInputType.multiline,
          hintText: widget.hintText, labelText: widget.labelText,
          border:  OutlineInputBorder(),
        ),
      ),
      itemCount: widget.addedMileston??0,
      separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h); },
    );
  }
}
