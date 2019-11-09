import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = "/account";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar( title: Text("Account"), ),
      body: Container(
          child:  Column(
                      children: <Widget>[
                                           Center( child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text("Member name:  John Q. Sellers"),
                                           ), ),
                                           Center( child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text("Account Level:  Platinum"),
                                           ), ),
                                           Center( child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Text("Account Rep:    Andrea Olivares"),
                                           ), ),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Center( child: Text("Rep Phone:      (313) 555-1212"), ),
                                           ),
                                        ]
                        ),
                      ),
                    );
   }
}
