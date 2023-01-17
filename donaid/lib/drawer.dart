import 'package:flutter/material.dart';
import 'package:donaid/theme.dart';

Drawer mydrawer () {

return   Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          
          color:  maincolor,
        ),
        child: Text('Menu'),
      ),
      ListTile(
        title: const Text('Αρχική'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: const Text('Οι Δωρεές μου'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),

      ListTile(
        title: const Text('Οι Δράσεις μου'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
     ListTile(
        title: const Text('Αγαπημένα'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),
);
}
