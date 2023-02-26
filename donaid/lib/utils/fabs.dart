import 'package:donaid/main.dart';
import 'package:donaid/utils/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:donaid/theme.dart';
import 'package:donaid/pages/qr.dart';
// import 'package:searchfield/searchfield.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:flutter_text_field_fab/flutter_text_field_fab.dart';
import '../pages/actions.dart';

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
    debugPrint("INIT");

    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,

      buttonSize: buttonSize,
      label: extend ? const Text("Open") : null,
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
          //onTap: () => debugPrint('Search'),
          onTap: () {
            // Navigator.pop(context);
            debugPrint("Search");
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SearchBar(title: '')),
            );

            // showDialog(
            // context: context,
            // builder: (BuildContext context) {
            //   return Dialog(
            //     // shape: RoundedRectangleBorder(
            //     //     borderRadius:
            //     //         BorderRadius.circular(50.0)), //this right here
            //     child: Container(
            //       height: 90,
            //       child: Padding(
            //         padding: const EdgeInsets.all(12.0),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             TextField(
            //               decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: 'Search...'),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   );
            // });
          },
          onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: !rmicons ? const Icon(Icons.qr_code) : null,
          backgroundColor: secondarycolor,
          foregroundColor: textlightpurple,
          label: 'Scan Donation QR Code',
          onTap: () {
            // Update the state of the app.
            // ...
            // Navigator.pop(context);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QRView()),
            );
          },
        )
      ],
    );
  }
}

class DonFab extends StatelessWidget {
  const DonFab({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.qr_code),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QRView(),
              ));
        });
  }
}

class AddFab extends StatelessWidget {
  const AddFab({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddActions(),
              ));
        });
  }
}
