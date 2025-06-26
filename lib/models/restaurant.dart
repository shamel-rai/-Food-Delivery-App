import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/models/cart_item.dart';
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
      imagePath: "assets/desserts/dessert_two.jpg",
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
  List<CartItem> get cart => _cart;

  // Operation
  // User cart
  List<CartItem> _cart = [];

  // 1. add to the cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with th esame food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameAddons && isSameAddons;
    });

    //if the item is already there, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise add new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  // 2. Remove from the cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // 3. tottal price of the cart
  double getTotalPrice() {
    double totalPrice = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      totalPrice += itemTotal * cartItem.quantity;
    }
    return totalPrice;
  }

  // 4. total number of itesm in the cart
  int getTotalItemCart() {
    int totalItem = 0;

    for (CartItem cartItem in _cart) {
      totalItem += cartItem.quantity;
    }

    return totalItem;
  }

  // 5. clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Helpers
  // 1.Generate the Receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // Format the date to include up to second only
    String fomattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());
    receipt.writeln(fomattedDate);
    receipt.writeln("----------------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
          ("    Addons: ${_formatAddons(cartItem.selectedAddons)}"),
        );
      }
      receipt.writeln();
    }
    receipt.writeln("-----------------------------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCart()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // 2. Format double value in to money
  String _formatPrice(double price) {
    return "Rs ${price.toStringAsFixed(2)}";
  }

  // 3. Format list of addons into a string summary

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
