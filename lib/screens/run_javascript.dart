import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatefulWidget {
  static const String routeName = "/run_javascript";
  final String strURLToLoad;
  final String webvwTitle;
  final int sellerID;
  final int addTableauFlags;

  static const String url_addons = "?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:refresh=yes";

  WebViewScreen(this.strURLToLoad, this.webvwTitle, this.sellerID, [this.addTableauFlags=1]);



  @override
  WebViewScreenState createState() {
    String fullURL;

    if (this.addTableauFlags == 1){
      fullURL = strURLToLoad + this.sellerID.toString() + WebViewScreen.url_addons;
    }
    else {
      fullURL = this.strURLToLoad;
    }

    return new WebViewScreenState(fullURL, this.webvwTitle);
  }
}

class WebViewScreenState extends State<WebViewScreen> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  String strURL;
  String appbarTitle;

  WebViewScreenState(this.strURL, this.appbarTitle);

  @override
  void initState(){
    super.initState();
    //flutterWebviewPlugin.evalJavascript("alert('Inducesmile.com')");
          // <div class='tableauPlaceholder' id='viz1573200342949' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ol&#47;Olist_Delivery&#47;DeliveryTreemap&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='Olist_Delivery&#47;DeliveryTreemap' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Ol&#47;Olist_Delivery&#47;DeliveryTreemap&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1573200342949');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='320px';vizElement.style.minHeight='677px';vizElement.style.maxHeight='877px';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='320px';vizElement.style.minHeight='677px';vizElement.style.maxHeight='877px';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';} else { vizElement.style.width='320px';vizElement.style.minHeight='677px';vizElement.style.maxHeight='877px';vizElement.style.height=(divElement.offsetWidth*1.77)+'px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
          //<center><iframe src="https://public.tableau.com/views/ATaleof50Cities/ATaleof50Cities?:embed=y&:display_count=yes&:toolbar=no" width="1004" height="1269" frameborder="0"></iframe></center>
  }
  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.strURL,
      //url: 'https://public.tableau.com/views/Olist_Delivery/DeliveryTreemap?:embed=y&:display_count=no&:toolbar=no&:showVizHome=no&:subscriptions=no&:showAppBanner=false&:showShareOptions=false&:toolbar=no',
      //url: 'https://inducesmile.com',
      hidden: true,
      appBar: AppBar(title: Text(this.appbarTitle)),
    );
  }
}