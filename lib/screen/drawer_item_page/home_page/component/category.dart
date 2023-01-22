import 'package:flutter/material.dart';
import 'package:home_land/screen/drawer_item_page/all%20real%20estate/land/category_land_view.dart';
class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({super.key});

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          child: TabBar(
              automaticIndicatorColorAdjustment: true,
              unselectedLabelColor: Colors.orange,
              indicator: BoxDecoration(),
              labelStyle: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              controller: _tabController,
              tabs: [
                Tab(text: 'House'),
                Tab(text: 'Apartment'),
                Tab(text: 'Office'),
                Tab(text: 'Land'),
              ]),
        ),
        Container(
          height: 498,
          child: TabBarView(
              physics: ScrollPhysics(),
              controller: _tabController,
              children: [
                CategoryLandPage(),
              ]),
        ),
      ],
    );
  }
}
