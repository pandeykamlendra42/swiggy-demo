import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key key,
    @required this.label,
    @required this.padding,
    @required this.groupValue,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Transform.scale(
                scale: 1.25,
                child: Radio<bool>(
                  groupValue: groupValue,
                  value: value,
                  onChanged: (bool newValue) {
                    onChanged(newValue);
                  },
                )),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}
