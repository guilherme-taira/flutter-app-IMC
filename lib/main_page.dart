import 'package:flutter/material.dart';
import 'package:flutter_application_imc/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
