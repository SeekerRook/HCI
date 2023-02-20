import 'package:flutter/material.dart';
import 'package:donaid/utils/action_card.dart';

class ActionsPage extends StatelessWidget{
   const ActionsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
    body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ActionCard(),
                  ActionCard(),
                  ActionCard(),                 
                ],
              )),
    ) 
    );
  }

  }


FloatingActionButton actfab = FloatingActionButton(onPressed: ()=>{},
    child: const Icon(Icons.add)
);



