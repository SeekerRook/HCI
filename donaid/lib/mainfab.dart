import 'package:flutter/material.dart';
import 'package:donaid/theme.dart';
import 'package:donaid/pages/qr.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
 
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

 class MainFab extends StatelessWidget {
    const MainFab({super.key});



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
              foregroundColor: texlightpurple,
              label: 'Search Donations',
              // onTap: () => setState(() => rmicons = !rmicons),
              onTap: () => debugPrint('Search'),

              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.qr_code) : null,
              backgroundColor: secondarycolor,
              foregroundColor: texlightpurple,
              label: 'Scan Donation QR Code',
              onTap: ()  {
          // Update the state of the app.
          // ...
            Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QRView()),
            );
            },
            )
          
              
          

          ],
        );
  }}