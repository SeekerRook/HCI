// import 'package:flutter/material.dart';
// //import 'package:donaid/utils/action_card.dart';

// class AddMapPage extends StatelessWidget {
//   const AddMapPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Νέος χάρτης'),
//       // ),
//       body: Center(
//         child: const Text('New map'),
//         // ElevatedButton(
//           // child: const Text('New map'),
//           // onPressed: () {
//           //   // Navigate to second route when tapped.
//           // },
//         // ),
//       ),
//     );
//   }
// }


// import 'dart:math';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:donaid/utils/tile_servers.dart';
// import 'package:donaid/utils/utils.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:latlng/latlng.dart';
// import 'package:map/map.dart';

// class AddMapPage extends StatefulWidget {
//   const AddMapPage({Key? key}) : super(key: key);

//   @override
//   AddMapPageState createState() => AddMapPageState();
// }

// class AddMapPageState extends State<AddMapPage> {
//   final controller = MapController(
//     location: const LatLng(37.97927142078896, 23.783097583782418),
//   );

//   // void _gotoDefault() {
//   //   controller.center = const LatLng(37.97927142078896, 23.783097583782418);
//   //   setState(() {});
//   // }

//   void _onDoubleTap(MapTransformer transformer, Offset position) {
//     const delta = 0.5;
//     final zoom = clamp(controller.zoom + delta, 2, 18);

//     transformer.setZoomInPlace(zoom, position);
//     setState(() {});
//   }

//   Offset? _dragStart;
//   double _scaleStart = 1.0;
//   void _onScaleStart(ScaleStartDetails details) {
//     _dragStart = details.focalPoint;
//     _scaleStart = 1.0;
//   }

//   void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
//     final scaleDiff = details.scale - _scaleStart;
//     _scaleStart = details.scale;

//     if (scaleDiff > 0) {
//       controller.zoom += 0.02;
//       setState(() {});
//     } else if (scaleDiff < 0) {
//       controller.zoom -= 0.02;
//       setState(() {});
//     } else {
//       final now = details.focalPoint;
//       final diff = now - _dragStart!;
//       _dragStart = now;
//       transformer.drag(diff.dx, diff.dy);
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: MapLayout(
//         controller: controller,
//         builder: (context, transformer) {
//           return GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onDoubleTapDown: (details) => _onDoubleTap(
//               transformer,
//               details.localPosition,
//             ),
//             onScaleStart: _onScaleStart,
//             onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
//             onTapUp: (details) {
//               final location = transformer.toLatLng(details.localPosition);

//               //final clicked = transformer.fromLatLngToXYCoords(location);
//               //print('${location.longitude}, ${location.latitude}');
//               //print('${clicked.dx}, ${clicked.dy}');
//               //print('${details.localPosition.dx}, ${details.localPosition.dy}');

//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   content: Text(
//                       'You have clicked on (${location.longitude}, ${location.latitude}).'),
//                 ),
//               );
//             },
//             child: Listener(
//               behavior: HitTestBehavior.opaque,
//               onPointerSignal: (event) {
//                 if (event is PointerScrollEvent) {
//                   final delta = event.scrollDelta.dy / -1000.0;
//                   final zoom = clamp(controller.zoom + delta, 2, 18);

//                   transformer.setZoomInPlace(zoom, event.localPosition);
//                   setState(() {});
//                 }
//               },
//               child: Stack(
//                 children: [
//                   TileLayer(
//                     builder: (context, x, y, z) {
//                       final tilesInZoom = pow(2.0, z).floor();

//                       while (x < 0) {
//                         x += tilesInZoom;
//                       }
//                       while (y < 0) {
//                         y += tilesInZoom;
//                       }

//                       x %= tilesInZoom;
//                       y %= tilesInZoom;

//                       return CachedNetworkImage(
//                         imageUrl: google(z, x, y),
//                         fit: BoxFit.cover,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),

//     );
//   }
// }
import 'dart:math';
import 'package:donaid/utils/action_card.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:donaid/theme.dart';
// import 'package:example/utils/tile_servers.dart';
// import 'package:example/utils/utils.dart';
import 'package:donaid/utils/tile_servers.dart';
import 'package:donaid/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:donaid/utils/action_card.dart';
import 'package:geocoder/geocoder.dart';


class AddMapPage extends StatefulWidget {
LatLng? addmaploc; 

  AddMapPage({Key? key}) : super(key: key);

  @override
  AddMapPageState createState() => AddMapPageState();
}



class AddMapPageState extends State<AddMapPage> {
  final controller = MapController(
    location: const LatLng(37.97927142078896, 23.783097583782418),
    zoom: 15,
  );
  // var widget.addmaploc;
  final markers = [
    //actual coordinates would be fetched from the app API, that is not implemented for this prototype. We are using dummy data
    const LatLng(37.97327142078896, 23.78297583782418),
    const LatLng(37.97527142078896, 23.78397583782418),
    // const LatLng(37.97727142078896, 23.784097583782418),
    // const LatLng(37.97227142078896, 23.786097583782418),
    // const LatLng(37.87327142078896, 23.78297583782418),
    // const LatLng(37.94527142078896, 23.783547583782418),
    // const LatLng(37.93727142078896, 23.782397583782418),
    // const LatLng(37.96227142078896, 23.779097583782418),
    // const LatLng(37.17327142078896, 23.72597583782418),
    // const LatLng(37.95727142078896, 23.75497583782418),
    // const LatLng(37.92627142078896, 23.743097583782418),
    // const LatLng(37.93827142078896, 23.787097583782418),
    // const LatLng(37.99027142078896, 23.70397583782418),
    // const LatLng(37.93027142078896, 23.72497583782418),
    // const LatLng(37.90027142078896, 23.765097583782418),
    // const LatLng(37.98927142078896, 23.778097583782418),
    // const LatLng(37.93427142078896, 23.73297583782418),
    // const LatLng(37.93427142078896, 23.74597583782418),
    // const LatLng(37.95627142078896, 23.733097583782418),
    // const LatLng(37.92927142078896, 23.777097583782418),
  ];
  final data = [
    //actual coordinates would be fetched from the app API, that is not implemented for this prototype. We are using dummy data
    "D1",// const LatLng(37.97327142078896, 23.78297583782418),
    "D2",// const LatLng(37.97527142078896, 23.78397583782418),
    // const LatLng(37.97727142078896, 23.784097583782418),
    // const LatLng(37.97227142078896, 23.786097583782418),
    // const LatLng(37.87327142078896, 23.78297583782418),
    // const LatLng(37.94527142078896, 23.783547583782418),
    // const LatLng(37.93727142078896, 23.782397583782418),
    // const LatLng(37.96227142078896, 23.779097583782418),
    // const LatLng(37.17327142078896, 23.72597583782418),
    // const LatLng(37.95727142078896, 23.75497583782418),
    // const LatLng(37.92627142078896, 23.743097583782418),
    // const LatLng(37.93827142078896, 23.787097583782418),
    // const LatLng(37.99027142078896, 23.70397583782418),
    // const LatLng(37.93027142078896, 23.72497583782418),
    // const LatLng(37.90027142078896, 23.765097583782418),
    // const LatLng(37.98927142078896, 23.778097583782418),
    // const LatLng(37.93427142078896, 23.73297583782418),
    // const LatLng(37.93427142078896, 23.74597583782418),
    // const LatLng(37.95627142078896, 23.733097583782418),
    // const LatLng(37.92927142078896, 23.777097583782418),
  ];

  void _gotoDefault() {
    controller.center = const LatLng(37.97927142078896, 23.783097583782418);
    controller.zoom = 15;
    debugPrint('${widget.addmaploc}${widget.addmaploc!.latitude}, ${widget.addmaploc!.longitude}');

    // Navigator.pop(context);
    setState(() {widget.addmaploc = controller.center;});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 1;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);

    setState(() {widget.addmaploc = controller.center;});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {widget.addmaploc = controller.center;});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      
      setState(() {widget.addmaploc = controller.center;});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {widget.addmaploc = controller.center;});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color, MapTransformer transformer,
      [IconData icon = Icons.location_on]) {
        widget.addmaploc = controller.center;
    return Positioned(      
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
          child: Icon(
            icon,
            color: color,
            size: 48,
          ),
          onTap: () {
            controller.center =
                transformer.toLatLng(Offset(pos.dx, pos.dy + 100));

            // controller.zoom = 18;

            setState(() {});
          }),
    );
  }





  Widget _buildMarkerWidgetwithbs(
      Offset pos,
      String ID,
      Color color,
      MapTransformer transformer,
      String title,
      String by,
      String place,
      String date,
      String description,
      String contact,
      [bool showbs = true,
      IconData icon = Icons.location_on]) {
    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
        child: Icon(
          icon,
          color: color,
          size: 48,
        ),
        onTap: () {
          debugPrint('${pos.dx}, ${pos.dy}');
          controller.center =
              transformer.toLatLng(Offset(pos.dx, pos.dy + 100));
          // controller.zoom = 15;
          setState(() {});

          showBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                    //  height: 200,
                    // padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
                    child: Wrap(children: [
                  ActionCard(ID)
//                           ListTile(
//                             title: Text(
//                               title,
// ),
//                             subtitle: Text("από: $by"),

//                             tileColor: maincolor,
//                           ),
//                           ListTile(
//                             title: Text(
//                               place,
//                               style: const TextStyle(color: Color(0xff49454F)),

//                             ),
//                             leading: Icon(Icons.place),

//                           ),
//                           ListTile(
//                             title: Text(
//                               date,
//                               style: const TextStyle(color: Color(0xff49454F)),

//                             ),
//                             leading: Icon(Icons.date_range),

//                           ),
//                           ListTile(
//                             title: Text(
//                               description,
//                               style: const TextStyle(color: Color(0xff49454F)),

//                             ),
//                             leading: Icon(Icons.info),

//                           ),
//                           ListTile(
//                             title: Text(
//                               'info@aggaliazois.com',
//                               style: const TextStyle(color: Color(0xff49454F)),

//                             ),
//                             onTap: () {
//                               Clipboard.setData(ClipboardData(text: contact));

//                             },
//                             leading: Icon(Icons.message),

//                           ),
                ]));
              });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: MapLayout(
        controller: controller,
        builder: (context, transformer) {
          final markerPositions = markers.map(transformer.toOffset).toList();
          // final markertuples = markerPositions.map()
          final markerTuples = [];
          for   (int i = 0; i< markerPositions.length; i++){
            markerTuples.add([markerPositions[i],data[i]]);
          }
          final markerWidgets = markerTuples.map(
            (pos) => _buildMarkerWidgetwithbs(
              pos[0],
              pos[1],
              pincolor,
              transformer,
              "title",
              "Organization",
              "0/0/2000 - 30/12/2055",
              "place",
              "Lore Ipsum ........",
              "info@mail.com",
            ),
          );

          final homeLocation = transformer
              .toOffset(const LatLng(37.97927142078896, 23.783097583782418));

          //final homeLocation = transformer.toOffset(const LatLng(37.97927142078896, 23.783097583782418));

          final homeMarkerWidget = _buildMarkerWidget(
              homeLocation, textpurple, transformer, Icons.my_location);

          final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2);

          final centerMarkerWidget =
              _buildMarkerWidget(centerLocation, Colors.purple, transformer);

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            // onDoubleTapDown: (details) => _onDoubleTap(
            //   transformer,
            //   details.localPosition,
            // ),
            onDoubleTap: _gotoDefault,
            onScaleStart: _onScaleStart,
            onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerSignal: (event) {
              // addmaploc=controller.center;

                if (event is PointerScrollEvent) {

                  final delta = event.scrollDelta.dy / -1000.0;
                  final zoom = clamp(controller.zoom + delta, 2, 18);

                  transformer.setZoomInPlace(zoom, event.localPosition);
                  setState(() {});
                }
              },
              child: Stack(
                children: [
                  TileLayer(
                    builder: (context, x, y, z) {
                      final tilesInZoom = pow(2.0, z).floor();

                      while (x < 0) {
                        x += tilesInZoom;
                      }
                      while (y < 0) {
                        y += tilesInZoom;
                      }

                      x %= tilesInZoom;
                      y %= tilesInZoom;

                      return CachedNetworkImage(
                        imageUrl: google(z, x, y),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  // homeMarkerWidget,
                  // ...markerWidgets,
                  centerMarkerWidget,
                ],
              ),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _gotoDefault,
      //   tooltip: 'My Location',
      //   child: const Icon(Icons.my_location),
      // ),
    );
  }
}


// FloatingActionButton mapfab = FloatingActionButton(
//   onPressed: () {},
//   child: Icon( 
//     Icons.save,
//     size: 20.0,
//   ),
  
// );
