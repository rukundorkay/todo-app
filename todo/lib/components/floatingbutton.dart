import 'package:flutter/material.dart';
import 'package:todo/screens/newTaskScreen.dart';

class floatingButton extends StatelessWidget {
  const floatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewTaskScreen()));
      },
      tooltip: 'add new item',
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
