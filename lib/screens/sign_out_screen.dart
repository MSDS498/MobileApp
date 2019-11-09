import 'package:flutter/material.dart';

class SignOutScreen extends StatefulWidget {
  SignOutScreen();

  static const String routeName = "/sign_out_screen";

  @override
  SignOutScreenState createState() => SignOutScreenState();

}


class SignOutScreenState extends State<SignOutScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign out?"),
      ),
      body: Column(
          children: <Widget>
            [
            Text("Are you sure you want to sign out?"),
            Center(
              child: RaisedButton(
                                    onPressed: () {
                                                    setState(() {
                                                      // pop closes the drawer
                                                      Navigator.of(context).pop();
                                                      // navigate to the route
                                                      Navigator.of(context).pushNamed('/sign_in_screen');
                                                               });
                                                  },
                                    child: Text('Sign out'),
                                ),
                   ),
            ]
      )
      );
  }
}