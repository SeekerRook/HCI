import 'package:donaid/pages/account.dart';
import 'package:donaid/main.dart';
import 'package:donaid/utils/action_card.dart';
import 'package:flutter/material.dart';
import 'package:donaid/utils/myaction_card.dart';
import 'package:donaid/pages/add_action.dart';
import 'package:donaid/theme.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:donaid/utils/data.dart';


class ActionsPage extends StatelessWidget{
   const ActionsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    get_data();
   List<Widget> myactions = [] ;
    for (var v in global_action.keys){
    if (global_action[v]!.organization == myID)
    myactions.add(ActionCard(v));
    }
    return 
    Scaffold(
    body: Container(
          padding: EdgeInsets.all(16.0),
          child: 
          RefreshIndicator(
            onRefresh: (()async{
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const AllActions()),
                ); 
                        }),
            child:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: myactions               
                ,
              ))
          )
        ,
    ) ,

    );
  
 
  }
  }


  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;

      
class AddActions extends StatelessWidget {
  const AddActions({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          foregroundColor: textblack,
          title: const Text("Προσθήκη Δράσης"),
        ),
     body: AddActionPage(),

      );
  }
}
 
