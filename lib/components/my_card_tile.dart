import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/components/my_quantity_selector.dart';
import 'package:recipe_app/models/cart_item.dart';
import 'package:recipe_app/models/restaurant.dart';

class MyCardTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCardTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food image
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),

                  SizedBox(width: 10),

                  // Name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(cartItem.food.name),

                      // Food Price
                      Text(
                        'Rs ${cartItem.food.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Increment and decreament quantity
                  MyQuantitySelector(
                    food: cartItem.food,
                    quantity: cartItem.quantity,
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    },
                    onIncrement: () {
                      restaurant.addToCart(
                        cartItem.food,
                        cartItem.selectedAddons,
                      );
                    },
                  ),
                ],
              ),
            ),

            // Addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: FilterChip(
                          label: Row(
                            children: [
                              // Addons name
                              Text(addon.name),

                              // addon price
                              Text("  Rs ${addon.price.toStringAsFixed(2)}"),
                            ],
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onSelected: (value) {},
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
