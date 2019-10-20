import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:oline_sellerassist/screens/account.dart';
import 'package:oline_sellerassist/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Header"));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Oline SellerAssist",
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
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
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
        title: Text("Oline Seller Assist"),
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
                      child: Text('See sales by state'),
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
    //TODO:  point this to the correct URL
    const url = 'https://public.tableau.com/profile/ashley.wenger#!/vizhome/Book2_15714679047420/Sheet2';
    if (await canLaunch(url)) {
      await launch(url);
      //forceWebView didn't work for tableau public dashboard; did for other urls (presumably mobile optimized?)    await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

}

//      https://public.tableau.com/views/SP500FemaleCEOs/Dashboard1?:embed=t&:display_count=no&:origin=viz_share_link
//      https://public.tableau.com/profile/ashley.wenger#!/vizhome/Book1_15714643502560/Dashboard1
