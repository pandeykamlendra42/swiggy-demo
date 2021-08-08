import 'package:flutter/material.dart';
import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/core/style/app_style.dart';
import 'package:swiggy/src/core/widgets/add_item_widget.dart';
import 'package:swiggy/src/models/condiment.dart';
import 'package:swiggy/src/models/data.dart';
import 'package:swiggy/src/models/dish.dart';
import 'package:swiggy/src/ui/widgets/combo_item_header.dart';
import 'package:swiggy/src/ui/widgets/multi_choice_addons_widget.dart';
import 'package:swiggy/src/ui/widgets/single_choice_addons_widget.dart';

class ComboCustomizationPage extends StatefulWidget {
  const ComboCustomizationPage({Key key}) : super(key: key);

  @override
  _ComboCustomizationPageState createState() => _ComboCustomizationPageState();
}

class _ComboCustomizationPageState extends State<ComboCustomizationPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final totalNotifier = ValueNotifier(0);
  final Dish _dish = DummyData.dishResponse;
  final selectedCondiments = <Condiment>[];
  bool _isHiddenAddonText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: AppConstants.topSidePadding),
        child: Stack(
          children: [
            Column(
              children: [
                ComboItemHeader(
                  heading: _dish.name,
                  type: _dish.type,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _dish.sections.length,
                      itemBuilder: (_, index) {
                        final section = _dish.sections[index];
                        return section.choiceType == ChoiceType.Single
                            ? SingleChoiceAddonsWidget(
                                section: section,
                                onChange: (condiment) {
                                  section.condiments.forEach((element) {
                                    element.isSelected = false;
                                  });
                                  condiment.isSelected = true;

                                  if (condiment.price > 0) {
                                    _dish.addonsCost = condiment.price;
                                  }
                                  totalNotifier.value += 1;
                                },
                              )
                            : MultiChoiceAddonsWidget(
                                section: section,
                                onChange: (condiments) {
                                  totalNotifier.value += 1;
                                },
                                onLimitExceed: (limit) {
                                  _showMessage(
                                      "You can only select up to $limit cookies");
                                },
                              );
                      }),
                )),
                SizedBox(
                  height: 120,
                )
              ],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ValueListenableBuilder(
                  valueListenable: totalNotifier,
                  builder: (_, notify, child) {
                    print("data>> ${_dish.addonsCost}");
                    var addonsText = this._dish.includedAddons;
                    var totalAddons = 0;
                    var singleChoiceSection = 0;
                    _dish.sections.forEach((section) {
                      singleChoiceSection =
                          section.choiceType == ChoiceType.Single
                              ? singleChoiceSection + 1
                              : 0;
                      section.condiments.forEach((element) {
                        if (element.isSelected) {
                          addonsText = "$addonsText, ${element.name}";
                          totalAddons += 1;
                        }
                      });
                    });
                    totalAddons =
                        totalAddons == 0 ? singleChoiceSection : totalAddons;

                    return Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(1, 1),
                            spreadRadius: 5,
                            blurRadius: 3)
                      ]),
                      padding: EdgeInsets.all(AppConstants.rightSidePadding),
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                this._isHiddenAddonText =
                                    !this._isHiddenAddonText;
                                totalNotifier.value += 1;
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                            AppConstants.rightSidePadding * 2),
                                    child: Text(
                                      "${addonsText.substring(1)}",
                                      style: AppStyle.subTitle
                                          .copyWith(fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines:
                                          this._isHiddenAddonText ? 1 : 10,
                                    ),
                                  )),
                                  Text(
                                    this._isHiddenAddonText
                                        ? "+$totalAddons Add On"
                                        : "Hide",
                                    style: AppStyle.title.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          AddItemWidget(
                            totalLabel:
                                "Item Total \u20B9${this._dish.baseCost + this._dish.addonsCost}",
                            onTap: () {
                              _showMessage("Item will be added from here!");
                            },
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  _showMessage(String message) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
