import 'package:flutter/material.dart';
import 'package:online_shopping/home_screen/page/home_screen_page.dart';
import 'package:online_shopping/tabs_screen/controller/tabs_screen_controller.dart';

class TabsScreenPage extends StatefulWidget {
  const TabsScreenPage({super.key});
  

  @override
  State<TabsScreenPage> createState() => _TabsScreenPage();
}

class _TabsScreenPage extends State<TabsScreenPage> {
   TabsScreenController? controller;

  int currentIndex = 0;
  final tabs = [
    HomeScreenPage(),
    Center(child: Text('Cart',style: TextStyle(fontSize: 60),),),
    Center(child: Text('Profile',style: TextStyle(fontSize: 60),),),
  ];

  @override
  void initState() {
    controller = TabsScreenController(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Shopping'),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {
            
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

}

