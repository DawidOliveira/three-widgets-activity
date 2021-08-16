import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Widgets Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height = 0;
  FlutterLogoStyle _logoType = FlutterLogoStyle.markOnly;

  @override
  void initState() {
    super.initState();
    animatedHeight(context).then((value) async {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
          content: Text(
            'Bem vindo!',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );
      if (_height == MediaQuery.of(context).size.height * .2) {
        await Future.delayed(Duration(milliseconds: 1400));
        setState(() {
          _logoType = FlutterLogoStyle.horizontal;
        });
      }
    });
  }

  Future<void> animatedHeight(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _height = MediaQuery.of(context).size.height * .2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: AnimatedContainer(
          height: _height,
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          child: FittedBox(
            child: FlutterLogo(
              style: _logoType,
              textColor: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
