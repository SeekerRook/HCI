import 'dart:math';
import 'package:donaid/utils/action_card.dart';
import 'package:donaid/utils/data.dart';
import 'package:donaid/utils/location.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:donaid/theme.dart';
// import 'package:example/utils/tile_servers.dart';
// import 'package:example/utils/utils.dart';
import 'package:donaid/utils/tile_servers.dart';
import 'package:donaid/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
ValueNotifier<LatLng> center =ValueNotifier(LatLng(37.97927142078896, 23.783097583782418));
 MapController global_controller = MapController(
    location: const LatLng(37.97927142078896, 23.783097583782418),
    zoom: 15,
  );
class InteractiveMapPage extends StatefulWidget {
  LatLng? pos;
  bool flag = true;

  InteractiveMapPage({this.pos, Key? key}) : super(key: key);

  @override
  InteractiveMapPageState createState() => InteractiveMapPageState();
}

class InteractiveMapPageState extends State<InteractiveMapPage> {
  List<LatLng> markers = [
    for (var val in global_action.values) (LatLng(val.x, val.y))
  ];
  var mdata = [for (var val in global_action.keys) (val)];
  //   LOCATION

  String? _currentAddress;
  LatLng _currentPosition = LatLng(37.97927142078896, 23.783097583782418);

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled. Please enable the services');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied');

        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      debugPrint(
          'Location permissions are permanently denied, we cannot request permissions.');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      debugPrint("Found GPS");
      debugPrint("NEW ${position.longitude},${position.longitude}");
      debugPrint("OLD 37.97927142078896, 23.783097583782418");
      setState(() =>
          _currentPosition = LatLng(position.latitude, position.longitude));
    }).catchError((e) {
      debugPrint(e);
    });
  }

 

//   /Location

  // final markers = [
  //   //actual coordinates would be fetched from the app API, that is not implemented for this prototype. We are using dummy data
  //   const LatLng(37.97327142078896, 23.78297583782418),
  //   const LatLng(37.97527142078896, 23.78397583782418),
  //   // const LatLng(37.97727142078896, 23.784097583782418),
  //   // const LatLng(37.97227142078896, 23.786097583782418),
  //   // const LatLng(37.87327142078896, 23.78297583782418),
  //   // const LatLng(37.94527142078896, 23.783547583782418),
  //   // const LatLng(37.93727142078896, 23.782397583782418),
  //   // const LatLng(37.96227142078896, 23.779097583782418),
  //   // const LatLng(37.17327142078896, 23.72597583782418),
  //   // const LatLng(37.95727142078896, 23.75497583782418),
  //   // const LatLng(37.92627142078896, 23.743097583782418),
  //   // const LatLng(37.93827142078896, 23.787097583782418),
  //   // const LatLng(37.99027142078896, 23.70397583782418),
  //   // const LatLng(37.93027142078896, 23.72497583782418),
  //   // const LatLng(37.90027142078896, 23.765097583782418),
  //   // const LatLng(37.98927142078896, 23.778097583782418),
  //   // const LatLng(37.93427142078896, 23.73297583782418),
  //   // const LatLng(37.93427142078896, 23.74597583782418),
  //   // const LatLng(37.95627142078896, 23.733097583782418),
  //   // const LatLng(37.92927142078896, 23.777097583782418),
  // ];

  //actual coordinates would be fetched from the app API, that is not implemented for this prototype. We are using dummy data
  // const LatLng(37.97327142078896, 23.78297583782418),
  // const LatLng(37.97527142078896, 23.78397583782418),
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
  // ];

  void _gotoDefault() {
    global_controller.center = _currentPosition;
    // widget.pos!; //const LatLng(37.97927142078896, 23.783097583782418);
    // controller.zoom = 15;

    // Navigator.pop(context);
    setState(() {});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 1;
    final zoom = clamp(global_controller.zoom + delta, 2, 18);

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
      global_controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      global_controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color, MapTransformer transformer,
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
            global_controller.center =
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
    var title = "${global_action[ID]!.title} \n ?????? ${global_user[global_action[ID]!.organization]!.username}  ";

    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 48,
            ),
            Expanded(
                child: Text(
              title,
              overflow: TextOverflow.visible,
              softWrap: false,
              style: TextStyle(
                  background: Paint()
                    ..color = Color.fromARGB(255, 198, 185, 234),
                  fontSize: 11),
              textAlign: TextAlign.center,
            ))
          ],
        ),
        onTap: () {
          get_data();
          debugPrint('${pos.dx}, ${pos.dy}');
          global_controller.center =
              transformer.toLatLng(Offset(pos.dx, pos.dy + 100));
          // controller.zoom = 15;
          setState(() {});

          showBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                    //  height: 200,
                    padding: const EdgeInsets.only(
                        top: kFloatingActionButtonMargin + 20),
                    child: Wrap(children: [ActionCard(ID)]));
              });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // LatLng mypos = LatLng(37.97927142078896, 23.783097583782418);
    // Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) => position = LatLng(value.latitude,value.longitude)).onError((error, stackTrace) => position = LatLng(37.97927142078896, 23.783097583782418));
    // _getCurrentPosition();

    debugPrint("LOC : BUILD ");
    if (widget.pos != null) {
      debugPrint("LOC : set");
      global_controller.center = widget.pos!;

      widget.pos = null;
      _getCurrentPosition().then((value) {
        widget.flag = false;
      });
    } else if (widget.flag) {
      debugPrint("LOC : gps");

      _getCurrentPosition().then((value) {
        global_controller.center = _currentPosition;
        widget.flag = false;
      });
    }
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: center,
        builder: (BuildContext context, LatLng counterValue,Widget? child){
          // global_controller.center = counterValue;
          return 
        MapLayout(
        controller: global_controller,
        builder: (context, transformer) {
          //  _getCurrentPosition().then((value){
          //   controller.center = _currentPosition;
          //  });

          final markerPositions = markers.map(transformer.toOffset).toList();
          // final markertuples = markerPositions.map()
          var markerTuples = [];
          for (int i = 0; i < markerPositions.length; i++) {
            markerTuples.add([markerPositions[i], mdata[i]]);
          }
          var markerWidgets = markerTuples.map(
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

          final homeLocation = transformer.toOffset(_currentPosition);

          //final homeLocation = transformer.toOffset(const LatLng(37.97927142078896, 23.783097583782418));
          var homeMarkerWidget = _buildMarkerWidget(
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
                if (event is PointerScrollEvent) {
                  final delta = event.scrollDelta.dy / -1000.0;
                  final zoom = clamp(global_controller.zoom + delta, 2, 18);

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
    );}),



      // floatingActionButton: FloatingActionButton(
      //   onPressed: _gotoDefault,
      //   tooltip: 'My Location',
      //   child: const Icon(Icons.my_location),
      // ),
    );
  }
}
