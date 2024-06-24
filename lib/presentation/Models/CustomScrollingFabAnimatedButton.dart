import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';

import '../../core/Colors.dart';

class CustomScrollingFabAnimatedButton extends StatefulWidget {

  final String tittle;
  final double height;
  final double? width;
  final double radius;
  final Widget icon;
  final void Function()? onPress;
  final ScrollController? scroll;
  const CustomScrollingFabAnimatedButton({super.key, required this.tittle,
    this.width, required this.height, required this.radius,
    required this.icon, this.onPress, this.scroll
  });

  @override
  State<CustomScrollingFabAnimatedButton> createState() => _CustomScrollingFabAnimatedButtonState();
}

class _CustomScrollingFabAnimatedButtonState extends State<CustomScrollingFabAnimatedButton> {

  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollingFabAnimated(
      icon: widget.icon,
      text: Text(widget.tittle, style: TextStyle(color: AppColors.textFormFieldColor, fontSize: 16.0, fontWeight:FontWeight.bold ),),
      onPress: widget.onPress,
      scrollController: widget.scroll,
      animateIcon: true,
      inverted: false,
      color: Theme.of(context).colorScheme.background,
      height: widget.height,
      width: widget.width,
      radius: widget.radius,
    );
  }
}
