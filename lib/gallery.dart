import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'imageGalleryPage.dart';

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
  final List<ImageModel> images = imagesCategory;
  static int indexing = 1;
  final List<ImageModel> categorizedImages = listImages;

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
      backgroundColor: Colors.pink.shade50,
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
                    category: images[index].category,
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
