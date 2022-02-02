import 'package:flutter/material.dart';
import 'package:todo/color.dart';
import 'package:todo/components/dialogBox.dart';
import 'package:todo/components/todoList.dart';
import 'package:todo/db/database.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/screens/landingTaskScreen.dart';

class TaskDetail extends StatefulWidget {
  TaskDetail({Key? key, required this.todo}) : super(key: key);
  final todo;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "images/soko.jpg",
                fit: BoxFit.fill,
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 2.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        // padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        decoration: const BoxDecoration(
                            color: darkprimarycolor,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(80))),
                        child: Text(
                          "${widget.todo.priority}",
                          style: const TextStyle(
                              color: primarycolor, fontSize: 12),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        margin: const EdgeInsets.fromLTRB(40, 10, 0, 10),
                        // padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        decoration: const BoxDecoration(
                            color: inputboxColor,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            updateDialog(context, widget.todo);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        // padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        decoration: const BoxDecoration(
                            color: inputboxColor,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(10))),
                        child: IconButton(
                          onPressed: () {
                            deleteDialog(context, widget.todo.id);
                          },
                          icon: Icon(Icons.cancel),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              const BorderSide(
                                  color: darkprimarycolor, width: 3.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              textprimarycolor),
                        ),
                        onPressed: () async {
                          final todo = Todo(
                              id: widget.todo.id,
                              title: widget.todo.title,
                              priority: widget.todo.priority,
                              createdDate: widget.todo.createdDate,
                              description: widget.todo.description,
                              modifiedDate: DateTime.now(),
                              status: "Yes");
                          var result = await TodoDatabase.instance.update(todo);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LandingTaskScreen()));
                        },
                        child: const Text("  DONE   "),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "${widget.todo.title} ",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Description ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text("${widget.todo.description} "),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Created ${dateChange(widget.todo.createdDate)}",
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          "Modified  ${dateChange(widget.todo.modifiedDate)} ",
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
