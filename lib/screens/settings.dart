import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
          children: <Widget>[
            Center(
                child: Text("Setting1"),
                ),
            Center(
                child: Text("Setting2"),
            ),
            Center(
                child: Text("Setting3"),
            ),
          ]
      ),
//
//
//      body: Container(
//          child: Center(
//            child: Text("Settings for Olist SellerAssist"),
//          )),
    );
  }
}