import 'package:flutter/material.dart';
import 'package:todo/screens/newTaskScreen.dart';
import 'package:todo/screens/taskDetails.dart';

class floatingButton extends StatelessWidget {
  const floatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NewTaskScreen()));
      },
      tooltip: 'add new item',
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
