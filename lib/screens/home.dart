import 'package:flutter/material.dart';
import 'package:olist_sellerassist/screens/account.dart';
import 'package:olist_sellerassist/screens/settings.dart';
import 'package:olist_sellerassist/screens/sign_out_screen.dart';
import 'package:olist_sellerassist/screens/financials_home.dart';
import 'package:olist_sellerassist/screens/CSatHomeScreen.dart';
import 'package:olist_sellerassist/screens/delivery_home.dart';



class HomeScreen extends StatefulWidget {
  final int sellrID;

  HomeScreen(this.sellrID);

  @override
  HomeScreenState createState() => HomeScreenState(this.sellrID);
}

class HomeScreenState extends State<HomeScreen> {
  int sellerID = 1;

  HomeScreenState(this.sellerID);



  // functions to construct the navigation drawer
  Drawer getNavDrawer(BuildContext context) {
    var headerTileForNavDrawer = DrawerHeader(child: Text("Main Menu"));
    var aboutTileForNavDrawer = AboutListTile(
        child: Text("About"),
        applicationName: "Olist SellerAssist",
        applicationVersion: "v1.0.1",
        applicationIcon: Icon(Icons.attach_money),
        icon: Icon(Icons.info));

    ListTile getListTileForNavDrawer(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            if (routeName == "Home") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(this.sellerID)),);
            } else {
              Navigator.of(context).pushNamed(routeName);
            }
          });
        },
      );
    }

    var listTilesForDrawer = [
      headerTileForNavDrawer,
      getListTileForNavDrawer(Icons.home, "Home", "Home"),
      getListTileForNavDrawer(Icons.account_box, "Account", AccountScreen.routeName),
      getListTileForNavDrawer(Icons.settings, "Settings", SettingsScreen.routeName),
      getListTileForNavDrawer(Icons.exit_to_app, "Log off", SignOutScreen.routeName),
      aboutTileForNavDrawer
    ];

    ListView listViewForDrawer = ListView(children: listTilesForDrawer);

    return Drawer(
      child: listViewForDrawer,
    );
    // end of functions to construct the nav drawer
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Olist Seller Assist"), ),
      body: Column( mainAxisAlignment: MainAxisAlignment.center,
                    children: <ListView>[ ListView( shrinkWrap: true,
                                          children: <ListTile>[
                                              ListTile(leading: Icon(Icons.attach_money), title: Text('Financials'), subtitle: Text('Review sales and rev by wk, qtr, ...'), isThreeLine: true, onTap: _openFinancialsHomeScreen, ),
                                              ListTile(leading: Icon(Icons.sentiment_satisfied), title: Text('Customer Satisfaction'), subtitle: Text('Check reviews, sentiment analysis, ...'), isThreeLine: true, onTap: _openCSatHomeScreen, ),
                                              ListTile(leading: Icon(Icons.local_shipping), title: Text('Delivery'), subtitle: Text('Check delivery status, recent performance'), isThreeLine: true, onTap: _openDeliveryHomeScreen, ),
                                                              ]
                                                  ),
                                        ],
                  ),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }

  _openFinancialsHomeScreen() {  Navigator.push(context, MaterialPageRoute(builder: (context) => FinancialsHomeScreen(this.sellerID))); }
  _openCSatHomeScreen() {  Navigator.push(context, MaterialPageRoute(builder: (context) => CSatHomeScreen(this.sellerID))); }
  _openDeliveryHomeScreen() {  Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryHomeScreen(this.sellerID))); }




}
