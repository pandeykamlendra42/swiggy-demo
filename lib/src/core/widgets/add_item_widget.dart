import 'package:flutter/material.dart';
import 'package:swiggy/src/core/style/app_style.dart';

class AddItemWidget extends StatelessWidget {
  final String totalLabel, ctaLabel;
  final Function onTap;
  const AddItemWidget(
      {Key key,
      @required this.onTap,
      this.totalLabel = "Item Total",
      this.ctaLabel = "Add Item"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(96, 178, 68, 1),
      child: InkWell(
        onTap: () {
          this.onTap();
        },
        splashColor: Colors.transparent.withOpacity(0.1),
        highlightColor: Colors.transparent.withOpacity(0.1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.totalLabel,
                style: AppStyle.heading
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
              Text(
                this.ctaLabel,
                style: AppStyle.heading
                    .copyWith(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
