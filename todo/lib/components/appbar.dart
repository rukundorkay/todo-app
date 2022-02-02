import 'package:flutter/material.dart';
import 'package:todo/color.dart';

AppBar buildAppBar(_scaffoldKey) {
  return AppBar(
    shadowColor: Color(0),
    leadingWidth: 100.0,
    leading: Card(
      color: darkprimarycolor,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          "images/IW_logo.png",
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: textprimarycolor,
            semanticLabel: "search",
          )),
      PopupMenuButton(
        icon: const Icon(
          Icons.menu,
          color: textprimarycolor,
          semanticLabel: "filter",
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          const PopupMenuItem(
            child: ListTile(
              title: Text('FILTER BY PRIORITY',
                  style: TextStyle(
                      color: darkprimarycolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w900)),
            ),
          ),
          const PopupMenuDivider(),
          const PopupMenuItem(
              child: Text('Low priority',
                  style: TextStyle(
                      color: darkprimarycolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w900))),
          const PopupMenuItem(
            height: kMiniButtonOffsetAdjustment,
            child: Text(
              'Medium priority',
              style: TextStyle(
                  color: darkprimarycolor,
                  fontSize: 12,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const PopupMenuItem(
              child: Text('high priority',
                  style: TextStyle(
                      color: darkprimarycolor,
                      fontSize: 12,
                      fontWeight: FontWeight.w900)))
        ],
      ),
    ],

    // leading: IconButton(
    //     icon: const Icon(
    //       Icons.menu,
    //       semanticLabel: 'menu',
    //     ),
    //     onPressed: () => _scaffoldKey.currentState.openDrawer()),
  );
}
