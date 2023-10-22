import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_ui/providers/provider.dart';
import 'package:shopping_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

