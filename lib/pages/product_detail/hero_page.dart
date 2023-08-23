import 'package:afisha_market/pages/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key, required this.imagUrl}) : super(key: key);

  final String imagUrl;
  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Container(
        child: Hero(
          tag: "heroOne",
          child: Container(
            color: Colors.white,
            child: Image.network(
              widget.imagUrl,
              width: double.infinity,
              height: 307,
            ),
          ),
        ),
      ),
    );
  }
}
