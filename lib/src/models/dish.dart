import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/models/condiment_section.dart';

class Dish {
  String name, includedAddons;
  DishType type;
  double baseCost, addonsCost;
  List<CondimentSection> sections;
  Dish({
    this.name,
    this.type,
    this.addonsCost,
    this.baseCost,
    this.includedAddons,
    this.sections,
  });
}
