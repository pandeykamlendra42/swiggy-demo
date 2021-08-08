import 'package:swiggy/src/core/app_constants.dart';

class Condiment {
  String name;
  DishType type;
  bool isSelected;
  double price;
  Condiment({this.name, this.type, this.isSelected = false, this.price = 0.0});
}
