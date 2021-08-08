import 'dart:math';

import 'package:flutter/material.dart';
import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/core/style/app_style.dart';
import 'package:swiggy/src/models/condiment_section.dart';
import 'package:swiggy/src/ui/widgets/multi_choice_option_widget.dart';

class MultiChoiceAddonsWidget extends StatelessWidget {
  final CondimentSection section;
  final Function(List<int>) onChange;
  final Function(int) onLimitExceed;
  MultiChoiceAddonsWidget(
      {Key key,
      @required this.section,
      @required this.onChange,
      @required this.onLimitExceed})
      : super(key: key);
  final changeNotifier = ValueNotifier(0);
  final selectedItems = <int>[];

  @override
  Widget build(BuildContext context) {
    final totalItems = Random().nextInt(4) + 1;
    return Container(
      padding: EdgeInsets.all(AppConstants.leftSidePadding),
      alignment: Alignment.centerLeft,
      child: ValueListenableBuilder(
          valueListenable: changeNotifier,
          builder: (_, selectedIndex, child) {
            return Column(
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
                          "${this.section.label} ${this.section.limit > 0 ? "(${this.selectedItems.length}/${this.section.limit})" : ""}",
                          style: AppStyle.heading.copyWith(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: this.section.condiments.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, index) {
                      final condiment = this.section.condiments[index];
                      return MultiChoiceItem(
                        condiment: condiment,
                        onChange: (v) {
                          if (this.section.limit > 0 &&
                              !selectedItems.contains(index) &&
                              selectedItems.length >= this.section.limit) {
                            this.onLimitExceed(this.section.limit);
                            return;
                          }
                          if (selectedItems.contains(index)) {
                            condiment.isSelected = false;
                            selectedItems.remove(index);
                          } else {
                            condiment.isSelected = true;
                            selectedItems.add(index);
                          }
                          this.onChange(selectedItems);
                          changeNotifier.value += 1;
                        },
                      );
                    }),
              ],
            );
          }),
    );
  }
}
