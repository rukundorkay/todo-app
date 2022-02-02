import 'package:flutter/material.dart';
import 'package:todo/color.dart';
import 'package:todo/components/appbar.dart';
import 'package:todo/components/cards.dart';
import 'package:todo/components/floatingbutton.dart';
import 'package:todo/components/todoList.dart';
import 'package:intl/intl.dart';
import 'package:todo/db/database.dart';

import 'landingScreen.dart';

var todos = [];
int? totalTask = 0;
int? activeTask = 0;
int? taskDone = 0;

class LandingTaskScreen extends StatefulWidget {
  LandingTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingTaskScreen> createState() => _LandingTaskScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _LandingTaskScreenState extends State<LandingTaskScreen> {
  @override
  void initState() {
    super.initState();
    getListoftodos();
  }

  Future<void> getListoftodos() async {
    var result = await TodoDatabase.instance.readAllTodos();
    var activeStatus = await TodoDatabase.instance.readTodoStatus("NO");
    if (result.isEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingScreen()));
    }
    setState(() {
      todos = result;
      totalTask = result.length;
      activeTask = activeStatus.length;
      taskDone = totalTask! - activeTask!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const floatingButton(),
      appBar: buildAppBar(_scaffoldKey),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: darkprimarycolor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  color: textprimarycolor,
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
                child: Stack(
                  children: [
                    const SizedBox(
                      child: Text(
                        "welcome",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w900),
                      ),
                    ),
                    GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 6,
                      crossAxisCount: 3,
                      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                      childAspectRatio: 1.2,

                      // Generate 100 widgets that display their index in the List.
                      children: [
                        dashboardCard(number: "$totalTask", text: "Total Task"),
                        dashboardCard(
                            number: "$activeTask", text: "Active Task"),
                        dashboardCard(number: "$taskDone", text: "Task Done"),
                      ],
                    ),
                    Container(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
                        child: ListView(
                          children: [
                            for (var todo in todos)
                              todoList(
                                todo: todo,
                              ),
                            Divider(),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
