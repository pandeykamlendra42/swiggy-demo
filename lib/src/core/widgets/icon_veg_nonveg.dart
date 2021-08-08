import 'package:flutter/material.dart';

class IconVegNonVeg extends StatelessWidget {
  final Color color;
  final double dimen;
  const IconVegNonVeg({Key key, this.color = Colors.green, this.dimen = 32.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.crop_square_sharp,
          color: this.color,
          size: this.dimen,
        ),
        Icon(Icons.circle, color: this.color, size: this.dimen / 3),
      ],
    );
  }
}
