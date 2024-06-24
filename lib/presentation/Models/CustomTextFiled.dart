import 'package:flutter/material.dart';

import '../../core/Constants.dart';

class CustomTextFiled extends StatefulWidget {
  final double topPadding;
  final int? rightPadding;
  final int? leftPadding;
  final TextEditingController? textControler;
  final String hintText;
  final String labelText;
  final Widget? icon;
  final InputBorder? border;
  final bool readonly;
  final bool focus;
  final TextInputType keyboardType;
  final void Function()? ontap;

  const CustomTextFiled({super.key, this.leftPadding,
    this.rightPadding,required this.topPadding, this.textControler
  ,required this.hintText, required this.labelText, this.icon,
   this.border, this.readonly = false, this.ontap, required this.keyboardType,
    this.focus = true
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
          top: widget.topPadding, left: 20.0, right: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.textControler,
        readOnly: widget.readonly,
        onTap: widget.ontap,
        canRequestFocus: widget.focus,
        // Use email input type for emails.
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          icon: widget.icon,
          border: widget.border,
          //labelStyle: TextStyle(color: Theme.of(context).colorScheme.,),
        ),
      ),
    );
  }
}
