import 'package:flutter/material.dart';
import 'package:music_app/screens/home_page.dart';
import 'package:music_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Streaming App',
      theme: context.watch<ThemeProvider>().themeData,
      home: const HomePage(),
    );
  }
}