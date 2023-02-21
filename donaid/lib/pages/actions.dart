import 'package:donaid/pages/account.dart';
import 'package:flutter/material.dart';
import 'package:donaid/utils/myaction_card.dart';
import 'package:donaid/pages/add_action.dart';
import 'package:donaid/theme.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


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
                  MyActionCard(),
                  MyActionCard(),
                  MyActionCard(),                 
                ],
              )),
    ) ,
    // floatingActionButton: FloatingActionButton(onPressed: (){
    //               Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //            builder: (context) =>  EditProfilePage()
    //             ),
    //         );
    //   }
    
    // )
    );
  
 
  }
  }



// FloatingActionButton actfab = FloatingActionButton(onPressed: () => {AddActionPage()});


// FloatingActionButton actfab = FloatingActionButton(onPressed: ()=>{
  
// },
//     child: const Icon(Icons.add)
// );



//  class ActionFab extends StatelessWidget {
//     const ActionFab({super.key});



//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return   FloatingActionButton(onPressed: ()=>{
//                   Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) =>  AddActionPage()),
//             )
// },
//     child: const Icon(Icons.add)
// );
//   }
//   }

 
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

 class ActionFab extends StatelessWidget {
    const ActionFab({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   SpeedDial(

          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,

          buttonSize:
              buttonSize, 
          label: extend
              ? const Text("Open")
              : null, 
          activeLabel: extend ? const Text("Close") : null,


          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',

          // elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          shape: customDialRoot
              ? const RoundedRectangleBorder()
              : const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.search) : null,
              backgroundColor: secondarycolor,
              foregroundColor: textlightpurple,
              label: 'Search Donations',
              // onTap: () => setState(() => rmicons = !rmicons),
              onTap: () => debugPrint('Search'),

              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.qr_code) : null,
              backgroundColor: secondarycolor,
              foregroundColor: textlightpurple,
              label: 'Scan Donation QR Code',
              onTap: ()  {
          // Update the state of the app.
          // ...
            // Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddActions()),
            );
            },
            )
          
              
          

          ],
        );
  }}

  
class AddActions extends StatelessWidget {
  const AddActions({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
        appBar: AppBar(
          // leading: ,
          backgroundColor: maincolor,
          foregroundColor: textblack,
          title: const Text("Προσθήκη Δράσης"),
        ),
     body: AddActionPage(),
      //floatingActionButton:const ActionFab(),

      
      // drawer: const MyDrawer(),
      );
  }
}
 
