import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebPageView extends StatefulWidget {
  final  String url;
  const WebPageView({ Key? key,required this.url }) : super(key: key);

  @override
  _WebPageViewState createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Platform.isAndroid){WebView.platform = AndroidWebView();}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      elevation: 0.0,
      leading: InkWell(
        onTap: (){Navigator.pop(context);},
        child: Icon(Icons.clear,color: Colors.black,)),
      backgroundColor: Colors.black12,
       title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text('Ne',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.orange),),
          Text('ws'),
          Text('yy',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.green),)],
        ),
        actions: [Text('          '),
         ],
      ),
    body: WebView(initialUrl: widget.url,));
  }
}