import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'gallerywidget.dart';

const whiteColor = Colors.white;
const blackColor = Colors.black;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final urlImages = [
    'assets/images/IMG_9379.JPG',
    'assets/images/IMG_8400.JPG',
    'assets/images/IMG_8522.JPG',
    'assets/images/IMG_8561.JPG',
    'assets/images/IMG_8579.JPG',
    'assets/images/IMG_8600.JPG',
    'assets/images/IMG_8614.JPG',
    // 'assets/images/IMG_8614.JPG',
    'assets/images/IMG_9379.JPG',
  ];

  var transformedImages = [];

  Future<dynamic> getSizeOfImages() async {
    transformedImages = [];
    for (int i = 0; i < urlImages.length; i++) {
      final imageObject = {};
      await rootBundle.load(urlImages[i]).then((value) => {
            imageObject['path'] = urlImages[i],
            imageObject['size'] = value.lengthInBytes,
          });
      transformedImages.add(imageObject);
    }
  }

  @override
  void initState(){
    getSizeOfImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: blackColor),
        ),
        iconTheme: const IconThemeData(color: blackColor),
      ),
      // Body area
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return RawMaterialButton(
                        child: InkWell(
                          child: Ink.image(
                            image: AssetImage(transformedImages as String\[index\]['path']),
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onPressed: () {
                          // Future<dynamic> sortImagesByIncreaseSize() async {
                          //   transformedImages.sort((a, b) => a['size'].compareTo(b['size']));
                          // }
                          // Future<dynamic> sortImagesByDecreaseSize() async {
                          //   transformedImages.sort((b, a) => a['size'].compareTo(b['size']));
                          // }
                          // Future<dynamic> sortImagesByNamesIncrease() async {
                          //   transformedImages.sort((a, b) => a['path'].compareTo(b['path']));
                          // }
                          // Future<dynamic> sortImagesByNamesDecrease() async {
                          //   transformedImages.sort((b, a) => a['path'].compareTo(b['path']));
                          // }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GalleryWidget(
                                        urlImages: urlImages,
                                        index: index,
                                      )));
                        },
                      );
                    },
                    itemCount: transformedImages.length,
                  )))
        ],
      )
      ),
    );
  }
}
