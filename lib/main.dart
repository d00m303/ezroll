import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prov/screens/page_view.dart';
import 'package:provider/provider.dart';

import 'util/provider.dart';

void main() async {
  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Customer()),
      ],
      child: MaterialApp(
        title: 'ezRoll',
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )),
        home: const MyPageView(),
      ),
    );
  }
}
