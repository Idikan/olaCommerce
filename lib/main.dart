import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/controllers/providers/cart_provider.dart';
import 'app/controllers/providers/favorite_provider.dart';
import 'app/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> FavoriteProvider()),
        ChangeNotifierProvider(create: (_)=> CartProvider()),
      ],
      child: MaterialApp(
          title: 'ola Commerce',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ),
    );
  }
}

