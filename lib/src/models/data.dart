import 'package:swiggy/src/core/app_constants.dart';
import 'package:swiggy/src/models/condiment.dart';
import 'package:swiggy/src/models/condiment_section.dart';
import 'package:swiggy/src/models/dish.dart';

class DummyData {
  static Dish dishResponse = Dish(
      name: "BFF Non-Veg Sub Combo(15 cm, 6 Inch)",
      type: DishType.NonVeg,
      baseCost: 890.0,
      addonsCost: 35.0,
      includedAddons: "",
      sections: [
        CondimentSection(
            choiceType: ChoiceType.Single,
            label: "Choice of Preparation",
            totalCost: 0.0,
            condiments: [
              Condiment(
                  name: "Plain Bread",
                  price: 0.0,
                  type: DishType.Veg,
                  isSelected: true),
              Condiment(
                  name: "Plain Bread with Cheese Slice",
                  price: 0.0,
                  type: DishType.Veg),
              Condiment(name: "Toasted Bread", price: 0.0, type: DishType.Veg),
              Condiment(
                  name: "Toasted Bread with Cheese Slice",
                  price: 0.0,
                  type: DishType.Veg),
              Condiment(
                  name: "Toasted with Mozzarella Cheese",
                  price: 0.0,
                  type: DishType.Veg),
            ]),
        CondimentSection(
            choiceType: ChoiceType.Single,
            label: "Choice of 1st Sub",
            totalCost: 0.0,
            condiments: [
              Condiment(
                  name: "Chicken Kofta",
                  price: 0.0,
                  type: DishType.Veg,
                  isSelected: true),
              Condiment(name: "Chicken Slice", price: 0.0, type: DishType.Veg),
              Condiment(
                  name: "Roasted Chicken strips",
                  price: 0.0,
                  type: DishType.Veg),
            ]),
        CondimentSection(
            choiceType: ChoiceType.Single,
            label: "Choice of 2nd Sub",
            totalCost: 0.0,
            condiments: [
              Condiment(
                  name: "Z-Chicken Kofta",
                  price: 0.0,
                  type: DishType.Veg,
                  isSelected: true),
              Condiment(
                  name: "Z-Chicken Slice", price: 0.0, type: DishType.Veg),
              Condiment(
                  name: "Roasted Z-Chicken strips",
                  price: 0.0,
                  type: DishType.Veg),
            ]),
        CondimentSection(
            choiceType: ChoiceType.Single,
            label: "Choice of Paid Cookie",
            totalCost: 0.0,
            condiments: [
              Condiment(
                  name: "Plain Cookie",
                  price: 35.0,
                  type: DishType.Veg,
                  isSelected: true),
              Condiment(
                  name: "Plain Cookie with Cheese Slice",
                  price: 65.0,
                  type: DishType.Veg),
              Condiment(
                  name: "Toasted Cookie", price: 45.0, type: DishType.NonVeg),
              Condiment(
                  name: "Toasted Cookie with Cheese Slice",
                  price: 75.0,
                  type: DishType.NonVeg),
              Condiment(
                  name: "Toasted with Mozzarella Cheese",
                  price: 95.0,
                  type: DishType.Veg),
            ]),
        CondimentSection(
            choiceType: ChoiceType.Multiple,
            label: "Choice of Free Cookie",
            totalCost: 0.0,
            limit: 3,
            condiments: [
              Condiment(
                  name: "Double Dark Chunk Chocolate Cookie",
                  price: 0.0,
                  type: DishType.NonVeg),
              Condiment(
                  name: "Ota Meal Raisin Cookie",
                  price: 0.0,
                  type: DishType.Veg),
              Condiment(
                  name: "Random Flavour Cookie",
                  price: 0.0,
                  type: DishType.Veg),
              Condiment(
                  name: "Dark Chunk Chocolate Cookie",
                  price: 0.0,
                  type: DishType.Veg),
              Condiment(
                  name: "Mix Chocolate Cookie", price: 0.0, type: DishType.Veg),
            ]),
        CondimentSection(
            choiceType: ChoiceType.Multiple,
            label: "Choice of Soft Drinks",
            totalCost: 0.0,
            condiments: [
              Condiment(
                  name: "Coke Mix Soda Water",
                  price: 0.0,
                  type: DishType.NonVeg),
              Condiment(
                  name: "Plain Soda Lime", price: 0.0, type: DishType.Veg),
              Condiment(
                  name: "Random Flavour Mocktail",
                  price: 0.0,
                  type: DishType.Veg),
              Condiment(
                  name: "Thumbs-up 60ml Cane", price: 0.0, type: DishType.Veg),
            ]),
      ]);
}
