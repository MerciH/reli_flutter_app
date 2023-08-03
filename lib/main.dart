import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

// import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'ReLi App';

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      );
}
