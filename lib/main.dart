import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const BookListApp());
}

class BookListApp extends StatelessWidget {
  const BookListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
      ),
      home: const HomePage(),
    );
  }
}
