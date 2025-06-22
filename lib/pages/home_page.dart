import 'package:flutter/material.dart';
import 'package:recipe_app/components/my_current_location.dart';
import 'package:recipe_app/components/my_description_box.dart';
import 'package:recipe_app/components/my_drawer.dart';
import 'package:recipe_app/components/my_silver_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Food Delivery App"),
      //   centerTitle: true,
      //   backgroundColor: Theme.of(context).colorScheme.background,
      // ),
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // my current location
                MyCurrentLocation(),

                // Desctiption box
                MyDescriptionBox(),
              ],
            ),
            title: Text("Title"),
          ),
        ],
        body: Container(color: Colors.blue),
      ),
    );
  }
}
