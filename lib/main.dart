import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter crossfade image Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // its boolean value which helps to shwich between images.
  bool _showFlutter = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
         _showFlutter =!_showFlutter; 
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cross Fade Image'),
        ),
        body: Container(
          child: Center(
            //AnimatedCrossFade is the widget which helps us to easily fade the two image with beautiful animation.
            child: AnimatedCrossFade(
              firstChild: Image.asset("assets/cat1.png"),
              secondChild: Image.asset("assets/cat2.png"),
              duration: Duration(
                seconds: 2,
              ),
              crossFadeState: _showFlutter
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
      ),
    );
  }
}
