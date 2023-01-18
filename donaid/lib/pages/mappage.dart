// import 'dart:math';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:donaid/utils/tile_servers.dart';
// import 'package:donaid/utils/utils.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:latlng/latlng.dart';
// import 'package:map/map.dart';

// class InteractiveMapPage extends StatefulWidget {
//   const InteractiveMapPage({Key? key}) : super(key: key);

//   @override
//   InteractiveMapPageState createState() => InteractiveMapPageState();
// }

// class InteractiveMapPageState extends State<InteractiveMapPage> {
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

class InteractiveMapPage extends StatefulWidget {
  const InteractiveMapPage({Key? key}) : super(key: key);

  @override
  InteractiveMapPageState createState() => InteractiveMapPageState();
}

class InteractiveMapPageState extends State<InteractiveMapPage> {
  final controller = MapController(
    location: const LatLng(37.97927142078896, 23.783097583782418),
    zoom: 15,
  );

  final markers = [
    const LatLng(37.97327142078896, 23.78297583782418),
    const LatLng(37.97527142078896, 23.78397583782418),
    const LatLng(37.97727142078896, 23.784097583782418),
    const LatLng(37.97227142078896, 23.786097583782418),
    const LatLng(37.87327142078896, 23.78297583782418),
    const LatLng(37.94527142078896, 23.783547583782418),
    const LatLng(37.93727142078896, 23.782397583782418),
    const LatLng(37.96227142078896, 23.779097583782418),   
    const LatLng(37.17327142078896, 23.72597583782418),
    const LatLng(37.95727142078896, 23.75497583782418),
    const LatLng(37.92627142078896, 23.743097583782418),
    const LatLng(37.93827142078896, 23.787097583782418),  
    const LatLng(37.99027142078896, 23.70397583782418),
    const LatLng(37.93027142078896, 23.72497583782418),
    const LatLng(37.90027142078896, 23.765097583782418),
    const LatLng(37.98927142078896, 23.778097583782418),  
    const LatLng(37.93427142078896, 23.73297583782418),
    const LatLng(37.93427142078896, 23.74597583782418),
    const LatLng(37.95627142078896, 23.733097583782418),
    const LatLng(37.92927142078896, 23.777097583782418),
  ];

  void _gotoDefault() {
    controller.center = const LatLng(37.97927142078896, 23.783097583782418);
    controller.zoom = 15;

    setState(() {});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 1;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
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
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color,
      [IconData icon = Icons.location_on]) {
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
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: Text('You have clicked a marker!'),
            ),
          );
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

          final markerWidgets = markerPositions.map(
            (pos) => _buildMarkerWidget(pos, pincolor),
          );

          final homeLocation = transformer.toOffset(const LatLng(37.97927142078896, 23.783097583782418));

          final homeMarkerWidget =
              _buildMarkerWidget(homeLocation, textpurple, Icons.my_location);

          final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2);

          final centerMarkerWidget =
              _buildMarkerWidget(centerLocation, Colors.purple);

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
                  homeMarkerWidget,
                  ...markerWidgets,
                  // centerMarkerWidget,
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