import 'package:flutter/material.dart';

class DonationsPage extends StatelessWidget{
  const DonationsPage({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Text("Donations"),
    );
  }
  }
FloatingActionButton donfab = FloatingActionButton(onPressed: ()=>{},
    child: const Icon(Icons.qr_code)
);