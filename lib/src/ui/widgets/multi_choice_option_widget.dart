import 'package:flutter/material.dart';
import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/core/style/app_style.dart';
import 'package:swiggy/src/core/widgets/icon_veg_nonveg.dart';
import 'package:swiggy/src/core/widgets/labeled_checkbox.dart';
import 'package:swiggy/src/models/condiment.dart';

class MultiChoiceItem extends StatelessWidget {
  final Condiment condiment;
  final Function(Condiment) onChange;
  const MultiChoiceItem(
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
            child: LabeledCheckbox(
              padding: EdgeInsets.symmetric(horizontal: 0),
              value: this.condiment.isSelected,
              label: this.condiment.name,
              onChanged: (v) {
                this.onChange(this.condiment);
              },
            ),
          )),
        ],
      ),
    );
  }
}
