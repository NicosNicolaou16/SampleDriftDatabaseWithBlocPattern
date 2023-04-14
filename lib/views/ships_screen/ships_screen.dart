import 'package:flutter/material.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({Key? key}) : super(key: key);

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Container(
        child: Text(
          "Flutter",
        ),
      ),
    ),);
  }
}
