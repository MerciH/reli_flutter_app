import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gallery.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0, // Remove shadow from the app bar
          backgroundColor: Colors.white, // Background color of the app bar
          centerTitle: true, // Center the title horizontally
          title: Text(
            'ReLi', // Your custom title text
            style: GoogleFonts.lobster(
              color: Colors.black,
              // Text color
              fontSize: 34, // Text size
              fontWeight: FontWeight.bold, // Text weight (bold)
              letterSpacing: 1.2, // Spacing between characters
              // You can also apply other styles like font family, etc. here
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ClipRRect(
            // borderRadius: BorderRadius.circular(8.0),
            Image.asset(
              'assets/brand/camera.jpeg',
              fit: BoxFit.cover,
            ),
            // ),
            Container(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'The best quality images\n Reality Life in Images',
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.normal, fontSize: 25),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade900),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageGridPage()));
                        },
                        child: const Text('Photos'))
                  ],
                ))
          ]),
        ));
  }
}
