import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/Colors.dart';

class dottedBorder extends StatefulWidget {
  final String text;
  final Icon icon;
  final double top;
  final void Function()? ontap;

  const dottedBorder({super.key, required this.text, required this.icon,required this.top, this.ontap});

  @override
  State<dottedBorder> createState() => _dottedBorderState();
}

class _dottedBorderState extends State<dottedBorder> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: widget.top),
        child: DottedBorder(
          color: AppColors.iconsColorsGray,
          dashPattern: [8, 4],
          strokeWidth: 1,
          child:  GestureDetector(
            onTap: widget.ontap,
            child: Container(
              height: 70.h,
              color: Colors.grey.withAlpha(60),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.add,
                      size: 50.sp,
                      color: AppColors.iconsColorsGray,
                    ),
                    Text(widget.text,style: TextStyle(color: AppColors.textFormFieldColorGray),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
