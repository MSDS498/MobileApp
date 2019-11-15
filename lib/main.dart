import 'package:flutter/material.dart';
import 'package:olist_sellerassist/screens/account.dart';
import 'package:olist_sellerassist/screens/settings.dart';
import 'package:olist_sellerassist/screens/sign_out_screen.dart';
import 'package:olist_sellerassist/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

//import 'package:olist_sellerassist/screens/home.dart';
//import 'package:olist_sellerassist/screens/run_javascript.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() {
  runApp(
    // This will provide, to all child widgets, the OlistAppData
    // That holds long-lived app data necessary
    // to construct the UI, persist values across screens, etc
    ChangeNotifierProvider(
      // Initialize the OlistAppData object in the builder. That way, Provider
      // can own OListAppData's lifecycle, making sure to call `dispose`
      // when not needed anymore.
      builder: (context) => OlistAppData(),
      child: MyOlistApp(),
    ),
  );
}




class MyOlistApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}




class OlistAppData with ChangeNotifier{
  int sellerID = 1;

  void changeSellerID (newSellerID) {
    sellerID = newSellerID;
    notifyListeners();
  }

}
//'/Delivery_Treemap': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?SellerID_param=9?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no&:refresh=yes", 'Delivery by customer state', 1),
//'/Pct_Late_ToCust': (BuildContext context) => RunJSInWebView("https://public.tableau.com/views/Olist_Delivery/PctLate_ToCust?SellerID_param=8?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no&:refresh=yes", '% Late Delivery to Customer', 1),
