import 'package:flutter/material.dart';
import 'package:todo/color.dart';
import 'package:todo/db/database.dart';

import 'landingScreen.dart';
import 'landingTaskScreen.dart';

var numberOfTodos;
var listOfTodos;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatorhome();
    _countTodos();
    setState(() {});
  }

  _countTodos() async {
    var result = await TodoDatabase.instance.readAllTodos();
    setState(() {
      numberOfTodos = result.length;
      listOfTodos = result;
    });
  }

  _navigatorhome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    if (numberOfTodos == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingScreen()));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => LandingTaskScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkprimarycolor,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 60.0,
            child: Image.asset("images/IW_logo.png"),
          ),
        ),
      ),
    );
  }
}
