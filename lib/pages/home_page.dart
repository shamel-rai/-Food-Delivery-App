import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/components/my_current_location.dart';
import 'package:recipe_app/components/my_description_box.dart';
import 'package:recipe_app/components/my_drawer.dart';
import 'package:recipe_app/components/my_food_tile.dart';
import 'package:recipe_app/components/my_silver_app_bar.dart';
import 'package:recipe_app/components/my_tab_bar.dart';
import 'package:recipe_app/models/food.dart';
import 'package:recipe_app/models/restaurant.dart';
import 'package:recipe_app/pages/food_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Food> _filtermethodByCategory(
    FoodCategory category,
    List<Food> fullMenu,
  ) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in the given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filtermethodByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // return the food tille UI
          return MyFoodTile(
            food: food,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food)),
              );
            },
          );
        },
      );
    }).toList();
  }

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
            title: MyTabBar(tabController: _tabController),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
