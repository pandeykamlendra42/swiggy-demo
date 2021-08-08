import 'package:flutter/material.dart';
import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/core/style/app_style.dart';
import 'package:swiggy/src/core/widgets/icon_veg_nonveg.dart';
import 'package:swiggy/src/core/widgets/labeled_radio.dart';
import 'package:swiggy/src/models/condiment.dart';

class SingleChoiceItem extends StatelessWidget {
  final Condiment condiment;
  final Function(bool) onChange;
  const SingleChoiceItem(
      {Key key, @required this.condiment, @required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      padding: EdgeInsets.only(top: 0, bottom: 5),
      child: Row(
        children: [
          IconVegNonVeg(
            color: this.condiment.type == DishType.Veg
                ? AppStyle.vegItemColor
                : AppStyle.nonVegItemColor,
            dimen: 18,
          ),
          Expanded(
              child: Container(
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: LabeledRadio(
              padding: EdgeInsets.symmetric(horizontal: 0),
              groupValue: this.condiment.isSelected,
              value: true,
              label: this.condiment.name,
              onChanged: (v) {
                this.onChange(v);
              },
            ),
          )),
        ],
      ),
    );
  }
}
