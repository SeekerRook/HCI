import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';

Future<bool> _handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location services are disabled. Please enable the services')));
    return false;
  }  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {   
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }  return true;
}
LatLng myposition = LatLng(37.97927142078896, 23.783097583782418); 
Future<LatLng> getpos(context) async {
  var res;
  final hasPermission = await _handleLocationPermission(context);  if (!hasPermission) return myposition;
  await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
      .then((Position position) { 
        debugPrint("Found GPS");
        debugPrint("NEW ${position.longitude},${position.longitude}");
        debugPrint("OLD 37.97927142078896, 23.783097583782418");
    ( res = LatLng(position.longitude,position.latitude));
  }).catchError((e) {
    debugPrint(e);
  });
  return res;
}