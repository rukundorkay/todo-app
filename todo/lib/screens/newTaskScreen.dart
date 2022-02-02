import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:todo/color.dart';

import 'package:todo/db/database.dart';
import 'package:todo/model/todo.dart';

import 'landingTaskScreen.dart';

var imageFile;
final title = TextEditingController();
final description = TextEditingController();
var priority;
bool titlevalidate = false;
bool descriptionvalidate = false;

class NewTaskScreen extends StatefulWidget {
  NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  ImagePicker picker = ImagePicker();

  void openGallery(BuildContext context) async {
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = (image != null) ? File(image.path) : null;
    });

    Navigator.pop(context);
  }

  void openCamera(BuildContext context) async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = (image != null) ? File(image.path) : null;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingTaskScreen()))
          },
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // textDirection: TextDirection.ltr,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New Task",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Add Image",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10.0),
            imageFile != null
                ? GestureDetector(
                    onDoubleTap: () => showChoiceDialog(context),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: inputboxColor,
                      child: Image.file(
                        File(imageFile.path),
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                : Container(
                    width: 100,
                    height: 100,
                    color: inputboxColor,
                    child: TextButton(
                      onPressed: () async {
                        showChoiceDialog(context);
                      },
                      child: const Text("Tap to add Image "),
                    ),
                  ),
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
              controller: title,
              maxLength: 140,
              onChanged: (text) => setState(() => title),
              style: const TextStyle(height: 1.0),
              decoration: InputDecoration(
                  errorText: titlevalidate ? 'Title Can\'t Be Empty' : null,
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
              controller: description,
              maxLength: 240,
              // onChanged: (text) => setState(() => descriptionvalidate = true),

              minLines:
                  3, // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(height: 1.0),
              decoration: InputDecoration(
                  errorText: descriptionvalidate
                      ? 'Description Can\'t Be Empty'
                      : null,
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
                setState(() {
                  priority = value;
                })
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
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ))),
                  onPressed: () async {
                    if (description.text.isEmpty || title.text.isEmpty) {
                      setState(() {
                        description.text.isEmpty
                            ? descriptionvalidate = true
                            : descriptionvalidate = false;
                        title.text.isEmpty
                            ? titlevalidate = true
                            : titlevalidate = false;
                      });
                    } else {
                      final todo = Todo(
                          title: title.text,
                          priority: priority,
                          createdDate: DateTime.now(),
                          description: description.text,
                          modifiedDate: DateTime.now(),
                          status: "NO");
                      var result = await TodoDatabase.instance.create(todo);
                      setState(() {
                        var imageFile = null;
                        final title = null;
                        final description = null;
                        var priority = null;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LandingTaskScreen()));
                      // print(result.length);
                    }
                  },
                  child: const Text(
                    "CREATE TASK",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: primarycolor),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: primarycolor,
                  ),
                  ListTile(
                    onTap: () {
                      openGallery(context);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.account_box,
                      color: primarycolor,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: primarycolor,
                  ),
                  ListTile(
                    onTap: () {
                      openCamera(context);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                      color: primarycolor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
