import 'dart:async';

import 'package:camera_app/camera_dashboard.dart';
import 'package:camera_app/camera_login.dart';
import 'package:camera_app/utils/size_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/LoginParentActivity': (BuildContext context) => new LoginScreen(),
        '/Dashboard': (BuildContext context) => new DashboardScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: getAddMainLogoLayout(
            SizeConfig.screenHeight, SizeConfig.screenWidth));
  }

  /* Get Add Main Logo Of WhatsApp Replica Layout */
  Widget getAddMainLogoLayout(double parentHeight, double parentWidth) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.grey.withOpacity(0.4), BlendMode.dstATop),
                image: new AssetImage("images/Backgroundimage.png"),
                fit: BoxFit.cover),
          ),
        ),
        getAddIconsAndChatLabelLayout(
            SizeConfig.screenHeight, SizeConfig.screenWidth),
      ],
    );
  }

  /* Get Add Puffle Icon And Chat Label Layout */
  Widget getAddIconsAndChatLabelLayout(
      double parentHeight, double parentWidth) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: parentHeight * .12),
          child: Container(
            height: parentHeight * .4,
            width: parentHeight * .4,
            decoration: BoxDecoration(),
            child: Image(
              image: new AssetImage("images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(),
              child: Text(
                "Camera App",
                style: TextStyle(
                  color: Colors.cyan,
                  fontFamily: "Aristotelica_regular",
                  fontSize: SizeConfig.safeBlockHorizontal * 10.0,
                ),
                textScaleFactor: 1.5,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: parentHeight * .02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                height: parentHeight * .04,
                image: new AssetImage("images/camera_image.png"),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: parentHeight * .04),
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 1,
          ),
        )
      ],
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashboardScreen()));
  }
}
