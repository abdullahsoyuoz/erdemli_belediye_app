import 'package:erdemli_bel_app/View/Style/colors.dart';
import 'package:flutter/material.dart';

class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  CustomSliverPersistentHeader(this.context,
      {this.child,
      this.maxExtentValue = 50,
      this.minExtentValue = 50,
      this.backgroundColor});

  BuildContext context;
  Widget child;
  double maxExtentValue;
  double minExtentValue;
  Color backgroundColor;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: backgroundColor ?? AppColors.tertiaryColor,
      child: child,
    );
  }

  @override
  double get maxExtent => maxExtentValue;

  @override
  double get minExtent => minExtentValue;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
