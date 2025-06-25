import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/components/my_button.dart';
import 'package:recipe_app/components/my_card_tile.dart';
import 'package:recipe_app/models/restaurant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restautant, child) {
        //  cart
        final userCart = restautant.cart;

        // Scafoold UI
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear all cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "Are you sure you want to clear all the cart?",
                      ),
                      actions: [
                        // Cancel
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        // Yes
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restautant.clearCart();
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              // List of Cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(child: Center(child: Text("Cart is Empty")))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // get individual cart item
                                final cartItem = userCart[index];

                                // return cart tile ui
                                return MyCardTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              // Buttton to pay
              MyButton(onTap: () {}, text: "Goto Checkout"),
              SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
