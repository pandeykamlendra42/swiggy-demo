import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key key,
    @required this.label,
    @required this.padding,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Transform.scale(
                scale: 1.25,
                child: Checkbox(
                  value: value,
                  onChanged: (v) {
                    onChanged(v);
                  },
                )),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}
