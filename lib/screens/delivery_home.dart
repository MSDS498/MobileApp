import 'package:flutter/material.dart';
import 'package:olist_sellerassist/screens/run_javascript.dart';



class DeliveryHomeScreen extends StatefulWidget{
  final int sellerID;

  DeliveryHomeScreen(this.sellerID);

  //static const String routeName = "/financial_home_screen";

  @override
  DeliveryHomeScreenState createState() => DeliveryHomeScreenState(this.sellerID);

}


class DeliveryHomeScreenState extends State<DeliveryHomeScreen>{
  int sellerID;

  DeliveryHomeScreenState(this.sellerID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Delivery KPIs"), ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                                        Center( child: Container( child: RaisedButton.icon ( icon: Icon(Icons.today), label: Text('In-Progress Deliveries'), onPressed: _viewDeliveryStatus, ), width: 200.0 ), ),
                                        Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.dashboard), label: Text('Delivery Treemap'), onPressed: _viewDeliveryTreemap, ), width: 200.0 ), ),
                                        Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.trending_up), label: Text('Pct Late Trends'), onPressed: _viewPctLateTrends, ), width: 200.0 ), ),
                                        //Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.gps_fixed), label: Text('Map'), onPressed: _viewDeliveryTreemap, ), width: 200.0 ), ),
                                      ]
                  ),
    );
  }

  _viewDeliveryStatus () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Delivery/DeliveryStatusDashboard?SellerID_param=",
                "In-Progress Deliveries",
                this.sellerID),
        )
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

  _viewPctLateTrends () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Delivery/PctLate_ToCust?SellerID_param=",
                "% Late Delivery to Customer",
                this.sellerID),
      )
  );
  }

}
