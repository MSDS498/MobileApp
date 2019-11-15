import 'package:flutter/material.dart';
import 'package:olist_sellerassist/screens/run_javascript.dart';
//import 'package:olist_sellerassist/screens/home.dart';



class CSatHomeScreen extends StatefulWidget {
  final int sellerID;

  CSatHomeScreen(this.sellerID);

  @override
  CSatHomeScreenState createState() => CSatHomeScreenState(this.sellerID);

}


class CSatHomeScreenState extends State<CSatHomeScreen>{
  int sellerID;

  CSatHomeScreenState(this.sellerID);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Customer Satisfaction KPIs"), ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                                       Center( child: Container( child: RaisedButton.icon ( icon: Icon(Icons.insert_chart), label: Text('Review Scores'), onPressed: _viewReviewScores, ), width: 200.0 ), ),
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.trending_up), label: Text('NPS Trends'), onPressed: _viewReviewScores, ), width: 200.0 ), ),
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.cloud), label: Text('Key Themes'), onPressed: _viewReviewScores, ), width: 200.0 ), ),
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.short_text), label: Text('Customer Verbatims'), onPressed: _viewReviewScores, ), width: 200.0 ), ),
                                     ]
                  ),
    );
  }

  _viewReviewScores() {
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
