import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/color.dart';
import 'package:todo/db/database.dart';
import 'package:todo/screens/landingScreen.dart';
import 'package:todo/screens/landingTaskScreen.dart';

Future<void> updateDialog(BuildContext context, var todo) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "update Todo",
            style: TextStyle(color: primarycolor),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                const Text(
                  "Title",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  // controller: title,
                  maxLength: 140,
                  //  onChanged: (text) => setState(() => title),
                  style: const TextStyle(height: 1.0),
                  decoration: InputDecoration(
                      // errorText: titlevalidate ? 'Title Can\'t Be Empty' : null,
                      filled: true,
                      fillColor: inputboxColor,
                      hintText: "Add task (140 characters)",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  //controller: description,
                  maxLength: 240,
                  // onChanged: (text) => setState(() => descriptionvalidate = true),

                  minLines:
                      3, // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(height: 1.0),
                  decoration: InputDecoration(
                      // errorText: descriptionvalidate
                      //     ? 'Description Can\'t Be Empty'
                      //     : null,
                      filled: true,
                      fillColor: inputboxColor,
                      hintText: "240 characters",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: Colors.teal))),
                ),
                const Text(
                  "Add Priority",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  onChanged: (value) => {
                    // setState(() {
                    //   priority = value;
                    // })
                  },
                  itemHeight: 48.0,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: inputboxColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                  ),
                  hint: const Text('select by'),
                  value: "low",
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem<String>(
                      value: "low",
                      child: Text(
                        "low",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "medium",
                      child: Text(
                        "medium",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "high",
                      child: Text(
                        "high",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

Future<void> deleteDialog(BuildContext context, int id) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "this todo item will be deleted permanently",
            style: TextStyle(color: secondarytextcolor, fontSize: 12),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(
                  height: 1,
                  color: primarycolor,
                ),
                ListTile(
                  onTap: () async {
                    var result = await TodoDatabase.instance.delete(id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LandingTaskScreen()));
                  },
                  title: const Text(
                    "Delete Item",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: primarycolor,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.blue),
                  ),
                  // leading: const Icon(
                  //   Icons.camera,
                  //   color: primarycolor,
                  // ),
                ),
              ],
            ),
          ),
        );
      });
}
