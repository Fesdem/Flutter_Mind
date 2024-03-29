import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
   _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(widget.favoriteMeals),
      'title': 'Your Favorite',
    },
  ];
    super.initState();
  }

  

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_pages![_selectedPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            // You need to declare the background color individually when
            // the bottomNavigationBar is shifting and not fixed but you
            // do not need to when it is fixed by default.

            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
