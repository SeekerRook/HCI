import 'package:flutter/material.dart';

class ActionsPage extends StatelessWidget{
  const ActionsPage({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Text("Actions"),
    );
  }
  }
FloatingActionButton actfab = FloatingActionButton(onPressed: ()=>{},
    child: const Icon(Icons.qr_code)
);