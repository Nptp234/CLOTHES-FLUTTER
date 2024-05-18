import 'package:clothes_app/screens/account.dart';
import 'package:clothes_app/screens/category.dart';
import 'package:clothes_app/screens/home.dart';
import 'package:clothes_app/screens/liked.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget{

  late final Widget child;

  BottomMenu({super.key, required this.child});

  @override
  _BottomMenu createState() => _BottomMenu();
}

class _BottomMenu extends State<BottomMenu>{

  late PageController _pageController;
  int _selectedIndex = 0;

  final List<String> _titles = ['Home', 'Category', 'Liked', 'Account'];

  List<IconData> iconLst = [
    Icons.home_outlined,
    Icons.category_outlined,
    CupertinoIcons.suit_heart,
    Icons.account_box_outlined,
  ];

  List<Widget> pageLst = [
    HomePage(),
    CategoryPage(),
    LikedPage(),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _onPageChanged(index);
  }

  void _onPageChanged(int index){
    _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: pageLst,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: List.generate(
            pageLst.length, 
            (index) => BottomNavigationBarItem(
              icon: Icon(iconLst[index]),
              label: _titles[index],
            )
          ),
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromRGBO(184, 142, 47, 1.000),
          unselectedItemColor: Colors.grey[400],
          onTap: _onItemTapped,
        ),

      ),
    );
  }
}