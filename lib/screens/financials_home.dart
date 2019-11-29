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
                                      //Center( child: Container( child: RaisedButton.icon ( icon: Icon(Icons.table_chart), label: Text('Sales Table'), onPressed: _viewSalesTreemap, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.dashboard), label: Text('Sales Treemap'), onPressed: _viewSalesTreemap, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.trending_up), label: Text('Financial Trends'), onPressed: _viewSalesTrends, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.gps_fixed), label: Text('Map of Orders'), onPressed: _viewSalesMapByState, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.gps_fixed), label: Text('Map of Orders2'), onPressed: _viewSalesMapByZip, ), width: 200.0 ), ),
                                      Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.gps_fixed), label: Text('Map of Orders3'), onPressed: _viewSalesMapByOrder, ), width: 200.0 ), ),
                                   ]
                  ),
    );
  }


  _viewSalesTreemap () {
                              Navigator.push(context,
                                          MaterialPageRoute(builder: (context) =>
                                          WebViewScreen(
                                                          "https://public.tableau.com/views/Olist_Financials_Dashbrd/Sales_Treemap?SellerID_param=",
                                                          "Sales Treemap",
                                                          this.sellerID),
                                                          )
                                            );
                          }

  _viewSalesTrends () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Financials_Dashbrd/TrendsOverTime?SellerID_param=",
                "Financial Trends",
                this.sellerID),
        )
    );
  }

  _viewSalesMapByState () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Financials_Dashbrd/SalesMapbystate?SellerID_param=",
                "Map of Sales",
                this.sellerID),
        )
    );
  }

  _viewSalesMapByZip () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Financials_Dashbrd/SalesMapbypostcode?SellerID_param=",
                "Map of Sales",
                this.sellerID),
        )
    );
  }

  _viewSalesMapByOrder () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Financials_Dashbrd/SalesMapbyorder?SellerID_param=",
                "Map of Sales",
                this.sellerID),
        )
    );
  }

}