import 'package:flutter/material.dart';
import 'package:olist_sellerassist/screens/account.dart';
import 'package:olist_sellerassist/screens/settings.dart';
import 'package:olist_sellerassist/screens/sign_out_screen.dart';
import 'package:olist_sellerassist/screens/sign_in_screen.dart';
//import 'package:olist_sellerassist/screens/home.dart';
//import 'package:olist_sellerassist/screens/run_javascript.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignInScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
//      '/home': (BuildContext context) => HomeScreen(),
      SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => AccountScreen(),
      SignOutScreen.routeName: (BuildContext context) => SignOutScreen(),
      SignInScreen.routeName: (BuildContext context) => SignInScreen(),
    },
  ));
}




//'/Delivery_Treemap': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?SellerID_param=9?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no&:refresh=yes", 'Delivery by customer state', 1),
//'/Pct_Late_ToCust': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/PctLate_ToCust?SellerID_param=8?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no&:refresh=yes", '% Late Delivery to Customer', 1),
