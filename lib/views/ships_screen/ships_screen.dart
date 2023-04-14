import 'package:flutter/material.dart';
import 'package:sampledriftdatabasewithblocpattern/domain/repositories/ships_repository.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({Key? key}) : super(key: key);

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    await ShipsRepository().requestAndSaveDataLocal().then((value) async {
      value.forEach((element) {
        print(element.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Flutter",
          ),
        ),
      ),
    );
  }
}
