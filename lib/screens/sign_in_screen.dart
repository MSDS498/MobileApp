import 'package:flutter/material.dart';
import 'package:olist_sellerassist/screens/home.dart';

class SignInScreen extends StatefulWidget{

  SignInScreen();

  static const String routeName = "/sign_in_screen";

  @override
  SignInScreenState createState() => SignInScreenState();

}


class SignInScreenState extends State<SignInScreen>{
  int sellerID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log-in to Olist Seller Assist"),
        ),
        body: Column(
            children: <Widget>
            [
              Center( child: Text("Please enter your username and password to sign in.")),
              Center( child: Text("")),
              Center( child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter your username'),
                                        onChanged: (text) { int val = int.tryParse(text) ?? 999;  this.sellerID = val;},)
                    ),
              Center( child: Text("")),
              Center( child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter your password'))),
              Center(
                child: RaisedButton(
                  onPressed: () {Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => HomeScreen(this.sellerID),  )
                                              );
                                },
                  child: Text('Sign in'),
                ),
              ),
            ]
        )
    );
  }
}




//Center(
//child: RaisedButton(
//onPressed: () {
//setState(() {
//// pop closes the drawer
//Navigator.of(context).pop();
//// navigate to the route
//Navigator.of(context).pushNamed('/');
//});
//},
//child: Text('Sign in'),
//),
//),
