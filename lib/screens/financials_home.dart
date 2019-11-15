import 'package:flutter/material.dart';
import 'package:olist_sellerassist/screens/run_javascript.dart';
//import 'package:olist_sellerassist/screens/home.dart';



class FinancialsHomeScreen extends StatefulWidget{
  final int sellerID;

  FinancialsHomeScreen(this.sellerID);

  //static const String routeName = "/financial_home_screen";

  @override
  FinancialsHomeScreenState createState() => FinancialsHomeScreenState(this.sellerID);

}


class FinancialsHomeScreenState extends State<FinancialsHomeScreen>{
  int sellerID;

  FinancialsHomeScreenState(this.sellerID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text("Financial KPIs"), ),
    body: Column(mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                                      Center( child: Container( child: RaisedButton.icon ( icon: Icon(Icons.table_chart), label: Text('Sales Table'), onPressed: _viewDeliveryTreemap, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.dashboard), label: Text('Sales Treemap'), onPressed: _viewDeliveryTreemap, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.trending_up), label: Text('Financial Trends'), onPressed: _viewDeliveryTreemap, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.gps_fixed), label: Text('Map of Orders'), onPressed: _viewDeliveryTreemap, ), width: 200.0 ), ),
                                   ]
                  ),
    );
  }


  _viewDeliveryTreemap () {
                              Navigator.push(context,
                                          MaterialPageRoute(builder: (context) =>
                                          WebViewScreen(
                                                          "https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?SellerID_param=",
                                                          "Delivery by customer state",
                                                          this.sellerID),
                                                          )
                                            );
                          }

}
