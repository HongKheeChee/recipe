import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';


class RecipeView extends StatefulWidget {

  final String postUrl;
  RecipeView({@required this.postUrl});

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {


  final Completer<WebViewController> _controller = Completer<WebViewController>();
  String finalUrl;
  @override
  void initState() {

    if(widget.postUrl.contains("http://")){
      finalUrl = widget.postUrl.replaceAll(("http://"), "https://");
    }else{
      finalUrl = widget.postUrl;

    }
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black54,
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30) ,
        child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: kIsWeb ? MainAxisAlignment.start :
              MainAxisAlignment .center,
              children: <Widget>[
                Text('food',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),),

                Text("Recipe", style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue
                ),)

              ],
            ),
          ),
          Container(height: MediaQuery.of(context).size.height - (Platform.isIOS ? 104 : 30),
            width: MediaQuery.of(context).size.width,
            child: WebView(
              onPageFinished: (val){
                print(val);
              },
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: finalUrl,
              onWebViewCreated: (WebViewController webViewController) {
                setState(() {
                  _controller.complete(webViewController);
                });
              },


            ),
          )
        ],
      ),
      )
    );
  }
}
