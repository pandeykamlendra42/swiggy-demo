import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/core/style/app_style.dart';
import 'package:swiggy/src/models/condiment.dart';
import 'package:swiggy/src/models/condiment_section.dart';
import 'package:swiggy/src/ui/widgets/single_choice_option_widget.dart';

class SingleChoiceAddonsWidget extends StatelessWidget {
  final Function(Condiment) onChange;
  final CondimentSection section;
  SingleChoiceAddonsWidget(
      {Key key, @required this.onChange, @required this.section})
      : super(key: key);
  final changeNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final totalItems = Random().nextInt(4) + 1;
    return Container(
      padding: EdgeInsets.all(AppConstants.leftSidePadding),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.stream,
                color: AppStyle.lightTextColor,
                size: 14,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AppConstants.leftSidePadding,
                      right: AppConstants.rightSidePadding,
                      bottom: 8),
                  child: Text(
                    this.section.label,
                    style: AppStyle.heading.copyWith(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
          ValueListenableBuilder(
              valueListenable: changeNotifier,
              builder: (_, selectedIndex, child) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: this.section.condiments.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, index) {
                      final condiment = this.section.condiments[index];
                      return SingleChoiceItem(
                        condiment: Condiment(
                            type: condiment.type,
                            name:
                                "${condiment.name}  \u20B9 ${condiment.price}",
                            isSelected: selectedIndex == index),
                        onChange: (v) {
                          condiment.isSelected = v;
                          this.onChange(condiment);
                          changeNotifier.value = index;
                        },
                      );
                    });
              })
        ],
      ),
    );
  }
}
