import 'package:flutter/material.dart';
import 'package:todo/color.dart';
import 'package:todo/components/appbar.dart';
import 'package:todo/components/cards.dart';
import 'package:todo/components/floatingbutton.dart';
import 'package:todo/screens/newTaskScreen.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _LandingScreenState extends State<LandingScreen> {
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
                            fontSize: 26, fontWeight: FontWeight.w500),
                      ),
                    ),
                    GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 6,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                      childAspectRatio: 1.8,

                      // Generate 100 widgets that display their index in the List.
                      children: const [
                        dashboardCard(number: "0", text: "Total Task"),
                        dashboardCard(number: "0", text: "active task"),
                        dashboardCard(number: "0", text: "Task Done"),
                        dashboardCard(
                            number: "0", text: "active High priority"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              "NOTHING HERE",
                              style: TextStyle(
                                  color: darkprimarycolor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Just like you crush Replies",
                              style: TextStyle(
                                  color: darkprimarycolor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            NewTaskScreen()));
                              },
                              child: const Text(
                                "START WITH A NEW TASK",
                                style: TextStyle(
                                  color: textprimarycolor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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
