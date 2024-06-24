import 'package:flutter/material.dart';

import '../../core/Colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String DefultTitle;
  const CustomAppBar({super.key, required this.DefultTitle});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      iconTheme: IconThemeData(color: AppColors.containerColorWhite),
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
      title: Text(widget.DefultTitle, style: TextStyle(color: AppColors.textFormFieldColor),),

    );
  }
}
