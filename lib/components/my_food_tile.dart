import 'package:flutter/material.dart';
import 'package:recipe_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        'Rs: ${food.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.asset(food.imagePath, height: 120),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
