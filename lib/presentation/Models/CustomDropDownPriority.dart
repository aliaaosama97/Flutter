import 'package:flutter/material.dart';

import '../../core/Methods.dart';

class dropdown extends StatefulWidget {
  final double? topPadding;
  final double? rightPadding;
  final double? leftPadding;
  final Widget label;
  final void Function(ColorLabel?) onselected;
  final ColorLabel? colorL;
  final bool ignor;
  final ColorLabel? initialSelection;
  final TextEditingController controller;
   dropdown({super.key, this.topPadding, this.rightPadding, this.leftPadding,
    required this.label, required this.onselected,
  required this.controller,required this.colorL, this.ignor = false, this.initialSelection = ColorLabel.red
  });

  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
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
              child: DropdownMenu<ColorLabel>(
                initialSelection: widget.initialSelection,
                controller: widget.controller,
                requestFocusOnTap: false,
                leadingIcon: Icon(Icons.priority_high, color: widget.colorL?.color),
                label: widget.label,
                onSelected: widget.onselected,
                dropdownMenuEntries: ColorLabel.values
                    .map<DropdownMenuEntry<ColorLabel>>(
                        (ColorLabel color) {
                      return DropdownMenuEntry<ColorLabel>(
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
