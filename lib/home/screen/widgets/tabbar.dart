import 'package:flutter/material.dart';

class TabBarOptions extends StatelessWidget {
  const TabBarOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.tab,
        splashBorderRadius: BorderRadius.circular(20),
        unselectedLabelColor: Colors.black87,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange

        ),

        tabs: [
          Tab(text: 'All'),
          Tab(text: 'Happy Hours'),
          Tab(text: 'Drinks'),
          Tab(text: 'Beer'),
        ]
      )
    );
  }
}