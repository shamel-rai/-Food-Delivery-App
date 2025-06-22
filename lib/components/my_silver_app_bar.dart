import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      floating: false,
      expandedHeight: 340,
      collapsedHeight: 120,
      pinned: true,
      actions: [
        // cart button
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Recipe Hunter"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(padding: EdgeInsets.only(bottom: 50), child: child),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 2,
      ),
    );
  }
}
