import 'package:flutter/material.dart';
import 'package:recipe_app/components/my_button.dart';
import 'package:recipe_app/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    // initialized selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food name
                      Text(
                        widget.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      // Food Price
                      Text(
                        "Rs ${widget.food.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      SizedBox(height: 10),

                      // Food Descriptiong
                      Text(
                        widget.food.description,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      SizedBox(height: 10),
                      Divider(color: Theme.of(context).colorScheme.secondary),
                      SizedBox(height: 10),

                      // Addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),

                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            // get individual addons
                            Addon addon = widget.food.availableAddons[index];

                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                "Rs ${addon.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //button add to cart
                MyButton(onTap: () {}, text: "Add to Cart"),

                SizedBox(height: 25),
              ],
            ),
          ),
        ),

        // Back Button
        SafeArea(
          child: Opacity(
            opacity: 0.3,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
