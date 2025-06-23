import 'package:flutter/material.dart';
import 'package:recipe_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // burger
    Food(
      name: 'Classic Burger',
      description: "A Juicy Chicken classic burger",
      imagePath: 'assets/burger/burger_one.jpg',
      price: 20,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Chesse', price: 5),
        Addon(name: 'Oninons', price: 5),
        Addon(name: 'Meat', price: 7),
      ],
    ),
    Food(
      name: "Burger With Fries",
      description: "Burger With Fries",
      imagePath: "assets/burger/burger_two.jpg",
      price: 20,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Fries", price: 10),
        Addon(name: "Extra Fries with Chesse", price: 15),
      ],
    ),
    Food(
      name: "Spicy Burger",
      description: "Burger That will Burn your ass",
      imagePath: "assets/burger/burger_three.jpg",
      price: 20,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Spicy", price: 10),
        Addon(name: "Spicy Pro Max", price: 15),
      ],
    ),
    Food(
      name: "Red Pastery",
      description: "Some Kind of Red Pastery",
      imagePath: "assets/desserts/dessert_one.jpg",
      price: 9,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Sprinkle candies", price: 4)],
    ),
    Food(
      name: "Red Velvet with fruits",
      description: "Some Kind of Red Pastery",
      imagePath: "assets/desserts/dessert_Two.jpg",
      price: 9,
      category: FoodCategory.desserts,
      availableAddons: [Addon(name: "Fruits", price: 6)],
    ),

    // drinks
    Food(
      name: "Coke",
      description: "Just Drink it ",
      imagePath: "assets/drinks/drink_one.jpeg",
      price: 10,
      category: FoodCategory.drinkts,
      availableAddons: [Addon(name: "Glass", price: 8)],
    ),
    // dessserts
  ];

  // Getters
  List<Food> get menu => _menu;

  // Operation
  // 1. add to the cart
  // 2. Remove from the cart
  // 3. tottal price of the cart
  // 4. total number of itesm in the cart
  // 5. clear the cart

  // Helpers
  // 1.Generate the Receipt
  // 2. Format double value in to money
  // 3. Format list of addons into a string summary
}
