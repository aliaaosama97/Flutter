import 'package:flutter/material.dart';

import '../../core/Methods.dart';

class CustomDropDownStates extends StatefulWidget {
  final double? topPadding;
  final double? rightPadding;
  final double? leftPadding;
  final Widget label;
  final void Function(ColorLabelProgress?) onselected;
  final ColorLabelProgress? colorL;
  final bool ignor;
  final ColorLabelProgress? initialSelection;
  final TextEditingController controller;
  const CustomDropDownStates({super.key,this.topPadding, this.rightPadding, this.leftPadding,
    required this.label, required this.onselected,
    required this.controller,required this.colorL, this.ignor = false, this.initialSelection = ColorLabelProgress.red});

  @override
  State<CustomDropDownStates> createState() => _CustomDropDownStatesState();
}

class _CustomDropDownStatesState extends State<CustomDropDownStates> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
            top: 30, left: 20.0, right: 20.0
        ),
        child: Row(
          children: [
            IgnorePointer(
              ignoring: widget.ignor,
              child: DropdownMenu<ColorLabelProgress>(
                initialSelection: widget.initialSelection,
                controller: widget.controller,
                requestFocusOnTap: false,
                leadingIcon: Icon(Icons.track_changes_rounded, color: widget.colorL?.color),
                label: widget.label,
                onSelected: widget.onselected,
                dropdownMenuEntries: ColorLabelProgress.values
                    .map<DropdownMenuEntry<ColorLabelProgress>>(
                        (ColorLabelProgress color) {
                      return DropdownMenuEntry<ColorLabelProgress>(
                        value: color,
                        label: color.label,
                        style: MenuItemButton.styleFrom(
                          foregroundColor: color.color,
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        )
    );
  }
}
