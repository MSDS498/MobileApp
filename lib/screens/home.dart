import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:navigation_drawer/screens/account.dart';
import 'package:navigation_drawer/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Header"));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
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
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
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
        title: Text("Navigation Drawer Example"),
      ),
      body: Container(
                child:
                    Center(
                          child: RaisedButton(
                                      onPressed: _launchURL,
                                      child: Text('Show our first viz'),
                          ),
                    ),
      ),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }
        //      https://public.tableau.com/views/SP500FemaleCEOs/Dashboard1?:embed=t&:display_count=no&:origin=viz_share_link
        //      https://public.tableau.com/profile/ashley.wenger#!/vizhome/Book1_15714643502560/Dashboard1
  _launchURL() async {
    const url = 'https://public.tableau.com/profile/ashley.wenger#!/vizhome/Book2_15714679047420/Sheet2';
    if (await canLaunch(url)) {
      await launch(url);
      //await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
}
