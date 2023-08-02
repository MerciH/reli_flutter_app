import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

import 'package:flutter/services.dart';
import 'gallerywidget.dart';

const whiteColor = Colors.white;
const blackColor = Colors.brown;

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

  Future<dynamic> sortImagesByIncreseSize() async {
    transformedImages.sort((a, b) => a['size'].compareTo(b['size']));
  }

  Future<dynamic> sortImagesByDecreseSize() async {
    transformedImages.sort((b, a) => a['size'].compareTo(b['size']));
  }

  Future<dynamic> sortImagesByNamesIncrease() async {
    transformedImages.sort((a, b) => a['path'].compareTo(b['path']));
  }

  Future<dynamic> sortImagesByNamesDecrease() async {
    transformedImages.sort((b, a) => a['path'].compareTo(b['path']));
  }

  @override
  void initState() {
    getSizeOfImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        elevation: 10,
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: blackColor),
        ),
        iconTheme: const IconThemeData(color: blackColor),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Filter By'),
                    // content: const Text("This is my message."),
                    actions: [
                      TextButton(
                        child: Column(
                          children: const [
                            Text('By size (Ascending)'),
                          ],
                        ),
                        onPressed: () {
                          sortImagesByIncreseSize()
                              .then((value) => setState(() {}));
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Column(
                          children: const [
                            Text('By size (descending)'),
                          ],
                        ),
                        onPressed: () {
                          sortImagesByDecreseSize()
                              .then((value) => setState(() {}));
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Column(
                          children: const [
                            Text('By name (Ascending)'),
                          ],
                        ),
                        onPressed: () {
                          sortImagesByNamesIncrease()
                              .then((value) => setState(() {}));
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Column(
                          children: const [
                            Text('By name (descending)'),
                          ],
                        ),
                        onPressed: () {
                          sortImagesByNamesDecrease()
                              .then((value) => setState(() {}));
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      // Body area
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Image.asset('assets/image/'),
          // Text(
          //   'A tablet is a wireless touch screen computer that is smaller than a notebook but larger than a smartphone.',
          //   style: TextStyle(fontSize: 20.0),
          // )

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
                            // image: AssetImage(transformedImages[index]['path']),
                            image: AssetImage('assets/images/IMG_9379.JPG'),
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onPressed: () {
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
      )),
    );
  }
}
