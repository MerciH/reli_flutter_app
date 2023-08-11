import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageModel {
  final String path;
  final String category;

  ImageModel({required this.path, required this.category});
}

List<ImageModel> imagesCategory = [
  ImageModel(path: 'Photography1.png', category: 'portraits'),
  ImageModel(path: 'Photography2.png', category: 'events'),
  ImageModel(path: 'Photography3.png', category: 'nature'),
  ImageModel(path: 'Photography4.png', category: 'animals'),
  ImageModel(path: 'Photography5.png', category: 'flowers'),
  ImageModel(path: 'Photography6.png', category: 'sunset'),
];

int indexing = 1;

List<ImageModel> listImages = [
  // portraits
  ImageModel(path: 'portraits/${indexing.toString()}', category: 'portraits'),
  ImageModel(path: 'portraits/2', category: 'portraits'),
  ImageModel(path: 'portraits/3', category: 'portraits'),
  ImageModel(path: 'portraits/4', category: 'portraits'),
  ImageModel(path: 'portraits/5', category: 'portraits'),
  ImageModel(path: 'portraits/6', category: 'portraits'),
  ImageModel(path: 'portraits/7', category: 'portraits'),
  ImageModel(path: 'portraits/8', category: 'portraits'),
  ImageModel(path: 'portraits/9', category: 'portraits'),
  ImageModel(path: 'portraits/10', category: 'portraits'),
  ImageModel(path: 'portraits/11', category: 'portraits'),
  ImageModel(path: 'portraits/12', category: 'portraits'),
  ImageModel(path: 'portraits/13', category: 'portraits'),
  ImageModel(path: 'portraits/14', category: 'portraits'),

  // events
  ImageModel(path: 'events/2', category: 'events'),
  ImageModel(path: 'events/3', category: 'events'),
  ImageModel(path: 'events/4', category: 'events'),
  ImageModel(path: 'events/5', category: 'events'),
  ImageModel(path: 'events/6', category: 'events'),
  ImageModel(path: 'events/7', category: 'events'),
  ImageModel(path: 'events/9', category: 'events'),
  ImageModel(path: 'events/10', category: 'events'),
  ImageModel(path: 'events/11', category: 'events'),
  ImageModel(path: 'events/12', category: 'events'),
  ImageModel(path: 'events/13', category: 'events'),
  ImageModel(path: 'events/14', category: 'events'),
  ImageModel(path: 'events/15', category: 'events'),
  ImageModel(path: 'events/16', category: 'events'),

  // nature
  ImageModel(path: 'nature/6', category: 'nature'),
  ImageModel(path: 'nature/2', category: 'nature'),
  ImageModel(path: 'nature/3', category: 'nature'),
  ImageModel(path: 'nature/4', category: 'nature'),
  ImageModel(path: 'nature/5', category: 'nature'),
  ImageModel(path: 'nature/7', category: 'nature'),
  ImageModel(path: 'nature/8', category: 'nature'),
  ImageModel(path: 'nature/9', category: 'nature'),
  ImageModel(path: 'nature/10', category: 'nature'),
  ImageModel(path: 'nature/11', category: 'nature'),
  ImageModel(path: 'nature/12', category: 'nature'),
  ImageModel(path: 'nature/13', category: 'nature'),

  // animals
  ImageModel(path: 'animals/1', category: 'animals'),
  ImageModel(path: 'animals/2', category: 'animals'),
  ImageModel(path: 'animals/3', category: 'animals'),
  ImageModel(path: 'animals/4', category: 'animals'),
  ImageModel(path: 'animals/5', category: 'animals'),
  ImageModel(path: 'animals/6', category: 'animals'),

  // flowers
  ImageModel(path: 'flowers/1', category: 'flowers'),
  ImageModel(path: 'flowers/2', category: 'flowers'),
  ImageModel(path: 'flowers/3', category: 'flowers'),
  ImageModel(path: 'flowers/4', category: 'flowers'),
  ImageModel(path: 'flowers/5', category: 'flowers'),
  ImageModel(path: 'flowers/6', category: 'flowers'),
  ImageModel(path: 'flowers/7', category: 'flowers'),
  ImageModel(path: 'flowers/8', category: 'flowers'),
  ImageModel(path: 'flowers/9', category: 'flowers'),
  ImageModel(path: 'flowers/10', category: 'flowers'),
  ImageModel(path: 'flowers/11', category: 'flowers'),
  ImageModel(path: 'flowers/12', category: 'flowers'),
  ImageModel(path: 'flowers/13', category: 'flowers'),
  ImageModel(path: 'flowers/14', category: 'flowers'),

  //sunset
  ImageModel(path: 'sunset/1', category: 'sunset'),
  ImageModel(path: 'sunset/2', category: 'sunset'),
  ImageModel(path: 'sunset/3', category: 'sunset'),
  ImageModel(path: 'sunset/4', category: 'sunset'),
  ImageModel(path: 'sunset/5', category: 'sunset'),
  ImageModel(path: 'sunset/6', category: 'sunset'),
  ImageModel(path: 'sunset/7', category: 'sunset'),
  ImageModel(path: 'sunset/8', category: 'sunset'),
  ImageModel(path: 'sunset/9', category: 'sunset'),
];

class ImageGalleryPage extends StatelessWidget {
  final List<ImageModel> images;
  final String category;

  ImageGalleryPage({required this.images, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category, // Your custom title text
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
      body:
            // children: <Widget>[
              GridView.builder(
                shrinkWrap:
                    true, // Use shrinkWrap to make the grid fit the content size
                physics:NeverScrollableScrollPhysics(), // Disable grid's scrolling
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
            // ],
    );
  }
}
