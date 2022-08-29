import 'package:effectivem_test/feature/presentation/pages/home/screen/home_page_screen.dart';
import 'package:effectivem_test/feature/presentation/pages/mockFavorites/mock_favorites_page.dart';
import 'package:effectivem_test/feature/presentation/pages/mockProfile/mock_profile_page.dart';
import 'package:effectivem_test/feature/presentation/pages/mockShop/mock_shop_page.dart';
import 'package:flutter/material.dart';

import '../home/widgets/bottom_nav_bar/bottom_navbar_widget.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final pageViewItems = const [
    HomePageScreen(),
    ShopPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  int curIndex = 0;

  void _updateIndex(int newIndex) {
    setState(() => curIndex = newIndex);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: buildNavBar(
        screenSize,
        curIndex: curIndex,
        updateindex: (index) => _updateIndex(index),
      ),
      body: IndexedStack(
        index: curIndex,
        children: pageViewItems,
      ),
    );
  }
}
