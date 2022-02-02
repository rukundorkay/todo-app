// import 'package:flutter/material.dart';
// import 'package:todo/color.dart';

// Future<void> showChoiceDialog(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text(
//             "Choose option",
//             style: TextStyle(color: primarycolor),
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: [
//                 const Divider(
//                   height: 1,
//                   color: primarycolor,
//                 ),
//                 ListTile(
//                   onTap: () {
//                     openGallery(context);
//                   },
//                   title: const Text("Gallery"),
//                   leading: const Icon(
//                     Icons.account_box,
//                     color: primarycolor,
//                   ),
//                 ),
//                 const Divider(
//                   height: 1,
//                   color: primarycolor,
//                 ),
//                 ListTile(
//                   onTap: () {
//                     //  _openCamera(context);
//                   },
//                   title: const Text("Camera"),
//                   leading: const Icon(
//                     Icons.camera,
//                     color: primarycolor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
