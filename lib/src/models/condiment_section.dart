import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/models/condiment.dart';

class CondimentSection {
  String label;
  int limit;
  double totalCost;
  ChoiceType choiceType;
  List<Condiment> condiments;
  CondimentSection(
      {this.label,
      this.limit = 0,
      this.totalCost,
      this.condiments,
      this.choiceType = ChoiceType.Single});
}
