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
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.cloud), label: Text('Key Themes'), onPressed: _viewWordCloud, ), width: 200.0 ), ),
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

  _viewWordCloud() {
    String wordCloudURL;
    switch(sellerID) {
      case 1:
        wordCloudURL = "https://drive.google.com/file/d/1ivYojgORBHZSini-zma_pGtnAr_gUgk9/view"; break;
      case 2:
        wordCloudURL = "https://drive.google.com/open?id=1Me468OW4XgWPA0wSE0-wtCZpoVdKNVga"; break;
      case 3:
        wordCloudURL = "https://drive.google.com/open?id=11hR0hljBKk-XSod09OO2cvJRq61qXmNJ"; break;
      case 4:
        wordCloudURL = "https://drive.google.com/open?id=1wG9OiNUX3Tn7JCZdlDOMhg3uaZATctyr"; break;
      case 5:
        wordCloudURL = "https://drive.google.com/open?id=1g4Elcg1WwO4jZMMfnAhCYgK3sw0WnjhM"; break;
      case 6:
        wordCloudURL = "https://drive.google.com/open?id=1h4_JzPeBvsDX0syRnRZS8p9zFHqyfdH1"; break;
      case 7:
        wordCloudURL = "https://drive.google.com/open?id=1Qy6rlOYCZ3bfW2EUehh1Vgybcwi43NHT"; break;
      case 8:
        wordCloudURL = "https://drive.google.com/open?id=1ptGsEEb8tdO3vt-7xr6YOsdxbhjYyhrw"; break;
      case 9:
        wordCloudURL = "https://drive.google.com/open?id=1FqjeikMP916SfCypNH4e8t9Y93589MmI"; break;
      case 10:
        wordCloudURL = "https://drive.google.com/open?id=1y0yLA3rC6T-2syKPauyBfFRB7LRso8Ws"; break;
      case 11:
        wordCloudURL = "https://drive.google.com/open?id=13CzSD54O-xV6FYTLnNExDr8-eTt7ROeS"; break;
      case 12:
        wordCloudURL = "https://drive.google.com/open?id=1kjdTLSMTRKvkrQ9k_xQEaPAoE6jyVDBF"; break;
      case 13:
        wordCloudURL = "https://drive.google.com/open?id=1U-msiM9P5bgMzL-BlrkmI_pLzTzXBkB-"; break;

      default:
        wordCloudURL = "https://drive.google.com/open?id=15Qb9kS1CgFcD94rc2Ywi-yymc6ply3cz"; break;
    }

    Navigator.push(context,
                   MaterialPageRoute(builder: (context) => WebViewScreen(wordCloudURL, "Word Cloud", this.sellerID, 0), )
    );
  }

}
