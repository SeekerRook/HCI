import 'package:flutter/material.dart';
import 'package:donaid_test/pages/mappage.dart';
import 'package:donaid_test/drawer.dart';
import 'package:donaid_test/theme.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DonAid',
      theme: mytheme,
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () { Scaffold.of(context).openDrawer(); },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
          backgroundColor: maincolor,
          foregroundColor: textblack,

          title: const Text("DonAid"),
        ),
      body: const InteractiveMapPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'More',
        child: const Icon(Icons.my_location),
      
      )
      ,
      drawer: mydrawer(),
      ),
    );
  }
}




