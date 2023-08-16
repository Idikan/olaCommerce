import 'package:flutter/material.dart';
import 'package:ola_commerce/app/screens/all_books.dart';
import 'package:ola_commerce/app/screens/cart_details_screen.dart';
import 'package:ola_commerce/app/screens/favorite_screen.dart';
import 'package:ola_commerce/app/screens/profile_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  List screens = const [
    AllBooksScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: const Text("olaCommerce Shop"),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> const CartDetailsScreen())),
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (value){
          setState(() => currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Favourite",
              icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
