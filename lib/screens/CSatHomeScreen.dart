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
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.trending_up), label: Text('NPS Trends'), onPressed: _viewNPSTrends, ), width: 200.0 ), ),
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.cloud), label: Text('Key Themes Cloud'), onPressed: _viewWordCloud, ), width: 200.0 ), ),
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.list), label: Text('Topic Clustering'), onPressed: _viewTopicCluster, ), width: 200.0 ), ),
                                       //Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.short_text), label: Text('Customer Verbatims'), onPressed: _viewReviewScores, ), width: 200.0 ), ),
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.insert_chart), label: Text('Impact of Delays'), onPressed: _viewImpactOfDelays, ), width: 200.0 ), ),
                                       Center( child: Container( child: RaisedButton.icon( icon: Icon(Icons.dashboard), label: Text('CSat Treemap'), onPressed: _viewCSatTreemap, ), width: 200.0 ), ),
                                     ]
                  ),
    );
  }

  _viewReviewScores() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Review_Dashbrd/OrdersbyReviewScore?SellerID_param=",
                "Orders by Review Score",
                this.sellerID),
        )
    );
  }

  _viewNPSTrends() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Review_Dashbrd/TrendsOverTime?SellerID_param=",
                "NPS, Score Trends",
                this.sellerID),
        )
    );
  }
  _viewImpactOfDelays() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Review_Dashbrd/ScoresbyDeliveryDelay?SellerID_param=",
                "Impact of Delayed Delivery",
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

  _viewTopicCluster() {
    String topicClusterURL;
    switch(sellerID) {
      case 1:
        topicClusterURL = "https://drive.google.com/open?id=14jCP4EoXGTaH_C1SeuQA2CVpAM-KmNmT"; break;
      case 2:
        topicClusterURL = "https://drive.google.com/open?id=19MRWGafjNzGxsDcYN9nTBYJ402EwPiKt"; break;
      case 3:
        topicClusterURL = "https://drive.google.com/open?id=1wX4n7U61ELCqoC04do0_C5pxzZwHi0VM"; break;
      case 4:
        topicClusterURL = "https://drive.google.com/open?id=19liD-GPj5PJRtKC-rG0HWTXnWz6wJy22"; break;
      case 5:
        topicClusterURL = "https://drive.google.com/open?id=1HmQcNhwIpv4UMMPlltRKFHYJ_caETrGS"; break;
      case 6:
        topicClusterURL = "https://drive.google.com/open?id=1hhcEOmGUxR46OkeXwVOWfb1qgFkiPJoH"; break;
      case 7:
        topicClusterURL = "https://drive.google.com/open?id=1N9C4Hwrnm7tlp_cwNSuvbVIrm9FL9oLM"; break;
      case 8:
        topicClusterURL = "https://drive.google.com/open?id=1PbbKDQ67XZsBrlmSagYa8hiBTZXw6Qoe"; break;
      case 9:
        topicClusterURL = "https://drive.google.com/open?id=1wTwTDvwFPs8ga_r-RDMfT9d1yLO-k4oa"; break;
      case 10:
        topicClusterURL = "https://drive.google.com/open?id=1yNP52zQs7Pqj0lY3uSnsV9G50G_9Zkdn"; break;

      default:
        topicClusterURL = "https://drive.google.com/open?id=1yNP52zQs7Pqj0lY3uSnsV9G50G_9Zkdn"; break;
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewScreen(topicClusterURL, "Topic Clusters - top 10", this.sellerID, 0), )
    );
  }



  _viewCSatTreemap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            WebViewScreen(
                "https://public.tableau.com/views/Olist_Review_Dashbrd/OrdersbyReviewScore?SellerID_param=",
                "Orders by Review Score",
                this.sellerID),
        )
    );
  }

}
