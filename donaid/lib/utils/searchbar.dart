

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyAwesomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     /// Wrap your Scrollable in a FloatingSearchBarScrollNotifier
//     /// to indicate that the FloatingSearchBar should react to
//     /// scroll events from this Scrollable.
//     return FloatingSearchBarScrollNotifier(
//       child: ListView.builder(
//         itemCount: 42,
//         itemBuilder: (_, index) => Item('Item $index'),
//       ),
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     // This is handled by the search bar itself.
//     resizeToAvoidBottomInset: false,
//     body: Stack(
//       fit: StackFit.expand,
//       children: [
//         buildMap(),
//         buildBottomNavigationBar(),
//         buildFloatingSearchBar(),
//       ],
//     ),
//   );
// }

// Widget buildFloatingSearchBar() {
//   final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

//   return FloatingSearchBar(
//     hint: 'Search...',
//     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//     transitionDuration: const Duration(milliseconds: 800),
//     transitionCurve: Curves.easeInOut,
//     physics: const BouncingScrollPhysics(),
//     axisAlignment: isPortrait ? 0.0 : -1.0,
//     openAxisAlignment: 0.0,
//     width: isPortrait ? 600 : 500,
//     debounceDelay: const Duration(milliseconds: 500),
//     onQueryChanged: (query) {
//       // Call your model, bloc, controller here.
//     },
//     // Specify a custom transition to be used for
//     // animating between opened and closed stated.
//     transition: CircularFloatingSearchBarTransition(),
//     actions: [
//       FloatingSearchBarAction(
//         showIfOpened: false,
//         child: CircularButton(
//           icon: const Icon(Icons.place),
//           onPressed: () {},
//         ),
//       ),
//       FloatingSearchBarAction.searchToClear(
//         showIfClosed: false,
//       ),
//     ],
//     builder: (context, transition) {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Material(
//           color: Colors.white,
//           elevation: 4.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: Colors.accents.map((color) {
//               return Container(height: 112, color: color);
//             }).toList(),
//           ),
//         ),
//       );
//     },
//   );
// }