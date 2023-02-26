import 'package:donaid/main.dart';
import 'package:flutter/material.dart';
import 'package:donaid/utils/action_card.dart';
import 'package:donaid/utils/data.dart';

class DonationsPage extends StatelessWidget {
  const DonationsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> donated = [] ;
    for (var v in global_action.keys){
    if (global_action[v]!.hasDonated)
    donated.add(ActionCard(v));
    }
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16.0),
      child:
              RefreshIndicator(
            onRefresh: (()async{

                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const Donations()),
                ); 
                        }),
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: donated,
          )),
    )));
  }
}

