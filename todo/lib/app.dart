import 'package:flutter/material.dart';
import 'package:todo/screens/SplashScreen.dart';

import 'components/theme.dart';

class Todo extends StatelessWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      // home: ,
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: TodoTheme,
      // builder: EasyLoading.init(),
    );
  }
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => SplashScreen(),
    fullscreenDialog: true,
  );
}
