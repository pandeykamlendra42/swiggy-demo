import 'package:flutter/material.dart';
import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/core/style/app_style.dart';
import 'package:swiggy/src/core/widgets/icon_veg_nonveg.dart';

class ComboItemHeader extends StatelessWidget {
  final String heading;
  final DishType type;
  const ComboItemHeader({Key key, @required this.heading, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(242, 245, 252, 1)),
      padding: EdgeInsets.only(
          left: AppConstants.leftSidePadding,
          right: AppConstants.rightSidePadding,
          top: 30,
          bottom: 32),
      child: Row(
        children: [
          IconVegNonVeg(
            color: this.type == DishType.NonVeg
                ? AppStyle.nonVegItemColor
                : AppStyle.vegItemColor,
            dimen: 24,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              this.heading,
              style: AppStyle.heading,
            ),
          ))
        ],
      ),
    );
  }
}
