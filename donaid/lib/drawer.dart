// import 'package:flutter/material.dart';
// import 'package:donaid/theme.dart';
// import 'dart:io';
// Drawer mydrawer () {

// return   Drawer(
//   // Add a ListView to the drawer. This ensures the user can scroll
//   // through the options in the drawer if there isn't enough vertical
//   // space to fit everything.
//   child: ListView(
//     // Important: Remove any padding from the ListView.
//     padding: EdgeInsets.zero,
//     children: [
//       const DrawerHeader(
//         decoration: BoxDecoration(
          
//           color:  maincolor,
//         ),
//         child: Text('Menu'),
//       ),
//       ListTile(
//         leading: const Icon(Icons.home),           

//         title: const Text('Αρχική'),
//         onTap: () {
//           // Update the state of the app.
//           // ...

//         },
//       ),
//       ListTile(
//         leading: const Icon(Icons.history),           

//         title: const Text('Οι Δωρεές μου'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),

//       ListTile(
//         leading: const Icon(Icons.add_location_alt),           

//         title: const Text('Οι Δράσεις μου'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),
//      ListTile(
//         leading: const Icon(Icons.favorite),           

//         title: const Text('Αγαπημένα'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),
//       const Divider(

//       ),
//       ListTile(
//         leading: const Icon(Icons.person),           

//         title: const Text('Λογαριασμός'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),
//       ListTile(
//         leading: const Icon(Icons.person_remove),           

//         title: const Text('Αποσύνδεση'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//         },
//       ),

//       ListTile(
//         leading: const Icon(Icons.exit_to_app),           

//         title: const Text('Έξοδος'),
//         onTap: () {
//           // Update the state of the app.
//           // ...
//           exit(0);
//         },
//       ),
//     ],
//   ),
// );
// }
