import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // Teststyle
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );
    // Teststyle
    var mySecondayTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Delivery fee
          Column(
            children: [
              Text('\$0.99', style: myPrimaryTextStyle),
              Text('Delivery Fee', style: mySecondayTextStyle),
            ],
          ),

          // Delivery Time
          Column(
            children: [
              Text('15-30 minutes', style: myPrimaryTextStyle),
              Text('Delivery Time', style: mySecondayTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
