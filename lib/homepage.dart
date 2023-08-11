import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gallery.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
        preferredSize: Size.fromHeight(80), // Adjust the height as needed
    child: Container(
    margin: EdgeInsets.only(top: 30), // Add margin to the top
    // padding: EdgeInsets.symmetric(horizontal: 16), // Add horizontal padding
    child: AppBar(
          elevation: 0, // Remove shadow from the app bar
          backgroundColor: Colors.blue.shade50, // Background color of the app bar
          centerTitle: true, // Center the title horizontally
          title: Text(
            'ReLi', // Your custom title text
            style: GoogleFonts.lobster(
              color: Colors.black,
              // Text color
              fontSize: 34, // Text size
              fontWeight: FontWeight.normal, // Text weight (bold)
              letterSpacing: 1.2, // Spacing between characters
              // You can also apply other styles like font family, etc. here
            ),
          ),
        ),
    ),
        ),
        backgroundColor: Colors.blue.shade50,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(45, 80, 0, 100),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ClipRRect(
            // borderRadius: BorderRadius.circular(8.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
              child: Image.asset(
                'assets/brand/camera.jpeg', // Replace with your image asset path
                width: 300, // Set the desired width
                height: 300, // Set the desired height
                fit: BoxFit.cover,
              ),
            ),
            // ),
            Container(
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'The best quality images',
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                    Text(
                      '\"Real Life in pixels\"',
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16),
                            backgroundColor: Colors.pink.shade900),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageGridPage()));
                        },
                        child: const Text('Get photos'))
                  ],
                ))
          ]),
        ));
  }
}
