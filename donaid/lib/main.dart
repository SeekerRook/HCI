import 'package:donaid/mymenu.dart';
import 'package:flutter/material.dart';
import 'package:donaid/pages/mappage.dart';
// import 'package:donaid/drawer.dart';
import 'package:donaid/pages/donations.dart';
import 'package:donaid/theme.dart';
import 'package:donaid/mainfab.dart';
import 'dart:io';

void main() {
  runApp( MaterialApp(
      title: 'DonAid',
      theme: mytheme,
      home: const MainPage(), 
  ));
}


// ValueNotifier<bool> isDialOpen = ValueNotifier(false);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DonAid',
      theme: mytheme,
      home: const MainPage(), 

    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
        appBar: AppBar(
          leading: mymenu,
          backgroundColor: maincolor,
          foregroundColor: textblack,
          title: const Text("DonAid"),
        ),
      body: const InteractiveMapPage(),
      floatingActionButton:  const MainFab(),

      
      drawer: const MyDrawer(),
      );
  }
}

class Donations extends StatelessWidget {
  const Donations({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
        appBar: AppBar(
          leading: mymenu,
          backgroundColor: maincolor,
          foregroundColor: textblack,
          title: const Text("Οι Δωρεές μου"),
        ),
      body: const  DonationsPage(),
      
      floatingActionButton:donfab,

      
      drawer: const MyDrawer(),
      );
  }
}

class MyDrawer extends StatelessWidget{
    const MyDrawer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return Drawer(
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
        leading: const Icon(Icons.home),           

        title: const Text('Αρχική'),
        onTap: () {
          // Update the state of the app.
          // ...
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
        },
      ),
      ListTile(
        leading: const Icon(Icons.history),           

        title: const Text('Οι Δωρεές μου'),
        onTap: () {
          // Update the state of the app.
          // ...
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Donations()),
            );
        },
      ),

      ListTile(
        leading: const Icon(Icons.add_location_alt),           

        title: const Text('Οι Δράσεις μου'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
     ListTile(
        leading: const Icon(Icons.favorite),           

        title: const Text('Αγαπημένα'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      const Divider(

      ),
      ListTile(
        leading: const Icon(Icons.person),           

        title: const Text('Λογαριασμός'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        leading: const Icon(Icons.person_remove),           

        title: const Text('Αποσύνδεση'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),

      ListTile(
        leading: const Icon(Icons.exit_to_app),           

        title: const Text('Έξοδος'),
        onTap: () {
          // Update the state of the app.
          // ...
          exit(0);
        },
      ),
    ],
  ),
);
  }
}



