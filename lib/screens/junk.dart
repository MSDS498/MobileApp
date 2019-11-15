import 'package:url_launcher/url_launcher.dart';

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
