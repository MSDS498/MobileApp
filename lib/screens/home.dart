import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:olist_sellerassist/screens/account.dart';
import 'package:olist_sellerassist/screens/settings.dart';
import 'package:olist_sellerassist/screens/run_javascript.dart';
import 'package:olist_sellerassist/screens/sign_out_screen.dart';
//import 'package:olist_sellerassist/screens/sign_in_screen.dart';


class HomeScreen extends StatefulWidget {
  final int sellrID;

  HomeScreen(this.sellrID);

  @override
  HomeScreenState createState() => HomeScreenState(this.sellrID);
}

class HomeScreenState extends State<HomeScreen> {
  int sellerID = 1;

  HomeScreenState(this.sellerID);

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Main Menu"));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Olist SellerAssist",
        applicationVersion: "v1.0.1",
        applicationIcon: Icon(Icons.attach_money),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
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

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.home, "Home", 'HomeScreen(this.sellerID)'),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      getNavItem(Icons.exit_to_app, "Log off", SignOutScreen.routeName),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olist Seller Assist"),
      ),
      body: Column(
          children: <Widget>[
            Center(
                child: RaisedButton(
                  onPressed: _viewSalesByCategory,
                  child: Text('See sales by category'),
                )
            ),
            Center(
              child: RaisedButton(
                onPressed: _viewSalesByState,
                child: Text('See diamonds app'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: _viewSalesByState2,
                child: Text('See fake news app'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: _viewDeliveryTreemap,
                child: Text('Delivery Treemap'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          RunJSInWebView(
                              "https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?SellerID_param=",
                              "Delivery by customer state", this.sellerID),
                      )
                  );
                },
                child: Text('Delivery Treemap in Webview'),
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          RunJSInWebView(
                              "https://public.tableau.com/views/Olist_Delivery/PctLate_ToCust?SellerID_param=",
                              "% Late Delivery to Customer", this.sellerID),
                      )
                  );
                },
                child: Text('% of Orders Late to Customer'),
              ),
            )
          ]
      ),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }



  // not sure why but these methods invoked by the OnPressed action have to have no params and no return value (void)
  // hence, it seems like we're making a bunch of repetitious code to do similar things
  _viewSalesByCategory() async {
    const url = 'https://public.tableau.com/profile/ashley.wenger#!/vizhome/Book2_15714679047420/Sheet2';
    if (await canLaunch(url)) {
      await launch(url);
      //forceWebView didn't work for tableau public dashboard; did for other urls (presumably mobile optimized?)    await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }


  _viewSalesByState() async {
    const url = 'https://olistsellersassist.shinyapps.io/demo1/';
    if (await canLaunch(url)) {
      await launch(url);
      //forceWebView didn't work for tableau public dashboard; did for other urls (presumably mobile optimized?)    await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }


  _viewSalesByState2() async {
    const url = 'https://olistsellersassist.shinyapps.io/fake_news_app/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _viewDeliveryTreemap() async {
    const url = 'https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}



//    // code to get the sellerID back
//    void _awaitReturnValueFromSignInScreen(BuildContext context) async {
//
//        // start the SignInScreen and wait for it to finish with a result
//        final result = await Navigator.push(
//        context,
//        MaterialPageRoute(
//        builder: (context) => SignInScreen(),
//        ));
//
//        // after the SecondScreen result comes back update the Text widget with it
//        setState(() {
//        this.sellerID = result;
//        });
//    }



//      https://public.tableau.com/views/SP500FemaleCEOs/Dashboard1?:embed=t&:display_count=no&:origin=viz_share_link
//      https://public.tableau.com/profile/ashley.wenger#!/vizhome/Book1_15714643502560/Dashboard1


//'/Delivery_Treemap': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?SellerID_param=9?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no&:refresh=yes", 'Delivery by customer state'),
//'/Pct_Late_ToCust': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/PctLate_ToCust?SellerID_param=8?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no&:refresh=yes", '% Late Delivery to Customer'),

//  '/Delivery_Treemap': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?SellerID_param=", 'Delivery by customer state', 1),
//  '/Pct_Late_ToCust': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/PctLate_ToCust?SellerID_param=", '% Late Delivery to Customer', 1),


// &:mobile=y&:device=phone&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no
//&:tooltip=n
//&:showAppBanner=n   instead of false?
