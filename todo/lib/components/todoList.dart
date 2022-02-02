import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/color.dart';

class todoList extends StatelessWidget {
  const todoList({Key? key, required this.todo}) : super(key: key);
  final todo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: const [
            Icon(
              Icons.check_box_outlined,
              color: darkprimarycolor,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.title,
                  style: const TextStyle(
                      color: darkprimarycolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
              Container(
                alignment: Alignment.center,
                width: 60,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                // padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                decoration: const BoxDecoration(
                    color: darkprimarycolor,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(80))),
                child: Text(
                  todo.priority,
                  style: const TextStyle(color: primarycolor, fontSize: 12),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Created ${dateChange(todo.createdDate)}",
                    style: const TextStyle(
                        fontSize: 8, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      "Modified ${dateChange(todo.modifiedDate)}",
                      style: const TextStyle(
                          fontSize: 8, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            children: const [
              Icon(
                Icons.more_vert,
                color: darkprimarycolor,
              )
            ],
          ),
        ),
      ],
    );
  }
}

String dateChange(DateTime date) {
  final DateTime now = date;
  final DateFormat formatter = DateFormat('dd MMM yyyy');
  final String formatted = formatter.format(now);
  return formatted;
}
