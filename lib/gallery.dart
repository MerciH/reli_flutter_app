import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGridPage(),
    );
  }
}

class ImageGridPage extends StatelessWidget {
  final List<String> images = [
    'Photography1.png',
    'Photography2.png',
    'Photography3.png',
    'Photography4.png',
    'Photography5.png',
    'Photography6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photos', // Your custom title text
          style: GoogleFonts.notoSans(
            color: Colors.white,
            // Text color
            fontSize: 34, // Text size
            fontWeight: FontWeight.bold, // Text weight (bold)
            letterSpacing: 1.2, // Spacing between characters
            // You can also apply other styles like font family, etc. here
          ),
        ),
        backgroundColor: Colors.pink.shade900,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 images in each row
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            'assets/brand/${images[index]}',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
