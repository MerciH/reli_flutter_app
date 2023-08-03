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

class ImageModel {
  final String path;
  final String category;

  ImageModel({required this.path, required this.category});
}

class ImageGridPage extends StatelessWidget {
  final List<ImageModel> images = [
    ImageModel(path: 'Photography1.png', category: 'portraits'),
    ImageModel(path: 'Photography2.png', category: 'events'),
    ImageModel(path: 'Photography3.png', category: 'nature'),
    ImageModel(path: 'Photography4.png', category: 'animals'),
    ImageModel(path: 'Photography5.png', category: 'flowers'),
    ImageModel(path: 'Photography6.png', category: 'sunset'),
  ];

  final List<ImageModel> categorizedImages = [
    ImageModel(path: 'Photography1.png', category: 'portraits'),
    ImageModel(path: 'events/1.JPEG', category: 'events'),
    ImageModel(path: 'Photography3.png', category: 'nature'),
    ImageModel(path: 'animals/1', category: 'animals'),
    ImageModel(path: 'Photography5.png', category: 'flowers'),
    ImageModel(path: 'Photography6.png', category: 'sunset'),
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageGalleryPage(
                    images: categorizedImages
                        .where(
                            (image) => image.category == images[index].category)
                        .toList(),
                  ),
                ),
              );
            },
            child: Image.asset(
              'assets/brand/${images[index].path}',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class ImageGalleryPage extends StatelessWidget {
  final List<ImageModel> images;
  // final List<ImageModel> images = [
  //   ImageModel(path: 'Photography1.png', category: 'portraits'),
  //   ImageModel(path: 'events/1.JPEG', category: 'events'),
  //   ImageModel(path: 'Photography3.png', category: 'nature'),
  //   ImageModel(path: 'animals/1', category: 'animals'),
  //   ImageModel(path: 'Photography5.png', category: 'flowers'),
  //   ImageModel(path: 'Photography6.png', category: 'sunset'),
  // ];

  ImageGalleryPage({required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            'assets/images/${images[index].path}',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
