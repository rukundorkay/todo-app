import 'package:flutter/material.dart';
import 'package:todo/screens/SplashScreen.dart';
import 'package:todo/screens/landingScreen.dart';
import 'package:todo/screens/landingTaskScreen.dart';
import 'package:todo/screens/newTaskScreen.dart';

import 'components/theme.dart';

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      // home: ,
      initialRoute: '/splash',
      onGenerateRoute: _getRoute,
      theme: TodoTheme,
      // builder: EasyLoading.init(),
    );
  }
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name != '/splash') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => SplashScreen(),
    fullscreenDialog: true,
  );
}
