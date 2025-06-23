import 'package:flutter/material.dart';
import 'package:recipe_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(text: category.toString().split(".").last);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: _buildCategoryTabs(),
        ),
      ),
    );
  }
}
