import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';

class DonaidUser {
  DonaidUser({
    required this.username,
    required this.email,
    required this.password,
    required this.contact,
    required this.bio,
    required this.imageurl,
  });
  String username;
  String email;
  String password;
  String contact;
  String bio;
  String imageurl;
  // String isMe;

  factory DonaidUser.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    var username = data['username'] as String;
    var email = data['email'] as String;
    var password = data['password'] as String;
    var contact = data['contact'] as String;
    var bio = data["bio"] as String;
    var imageurl = data["imageurl"] as String;

    return DonaidUser(
        username: username,
        email: email,
        password: password,
        contact: contact,
        bio: bio,
        imageurl: imageurl);
  }
   Map toDict() {
    var data = {};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['contact'] = contact;
    data["bio"] = bio;
    data["imageurl"] = imageurl;

    return data;
  }
}

class DonaidAction {
  DonaidAction(
      {required this.title,
      required this.organization,
      required this.date,
      required this.place,
      required this.x,
      required this.y,
      required this.imgpath,
      required this.isFavorite,
      required this.hasDonated,
      required this.type,
      required this.description});
  String title;
  String organization;
  String imgpath;
  bool hasDonated;
  bool isFavorite;
  String type;
  String date;
  String place;
  double x;
  double y;
  String description;

  factory DonaidAction.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    var title = data['title'].toString() as String;
    var organization = data['organization'] as String;
    var date = data['date'] as String;
    var imgpath = data["imgpath"] as String;
    var hasDonated = data["hasDonated"] as bool;
    var isFavorite = data["isFavorite"] as bool;
    var type = data["type"] as String;
    var place = data['place'] as String;
    var x = data['x'] as double;
    var y = data['y'] as double;
    var description = data['description'] as String;

    return DonaidAction(
      title: title,
      organization: organization,
      date: date,
      place: place,
      x: x,
      y: y,
      imgpath: imgpath,
      hasDonated: hasDonated,
      isFavorite: isFavorite,
      type: type,
      description: description,
    );
  }
  Map toDict() {
    var data = {};
    data['title'] = title;
    data['organization'] = organization;
    data['date'] = date;
    data["imgpath"] = imgpath;
    data["hasDonated"] = hasDonated;
    data["isFavorite"] = isFavorite;
    data["type"] = type;
    data['place'] = place;
    data['x'] = x;
    data['y'] = y;
    data['description'] = description;
    return data;
  }
}

String myID = "U0";
// DonaidUser me = 

Map<String, DonaidUser> global_user =
    Map<String, DonaidUser>(); //List<DonaidAction>(


Map<String, DonaidAction> global_action =
    Map<String, DonaidAction>(); //List<DonaidAction>(

// Map<String, DonaidAction> user_ID =
//     Map<String, DonaidAction>(); //List<DonaidAction>(

var client = Client();
Future<String> get_data_() async {
  var geturl = Uri.http('seekerrook.pythonanywhere.com', 'actions/');
  var posturl = Uri.http('seekerrook.pythonanywhere.com', 'actions/post');
  final response = (await client.get(geturl)).body;
  debugPrint('got response');

  debugPrint('Response : ${response}');

  if (global_action.isEmpty) {
    debugPrint('EMPTY');

    // final data = jsonDecode(response);
    final data = (await json.decode(response))['data'];

    for (int i = 0; i < data.length; i++) {
      global_action["${data[i]["ID"]}"] = DonaidAction.fromJson(data[i]);
    }
  } else {
    debugPrint('! EMPTY');

    var response = [];
    for (var i in global_action.keys) {
      debugPrint('! ${global_action} , ${global_action[i]}');
      var ele = global_action[i]!.toDict();
      ele["ID"] = i;
      response.add(ele);
    }
    String result = jsonEncode({"data": response});
    await client.post(posturl,
        headers: {"Content-Type": "application/json"}, body: result);
    // file.writeAsString(result);
    // .fromJson(file.readAsString());
  }
  return "action";
}
Future<String> get_users_() async {
  var geturl = Uri.http('seekerrook.pythonanywhere.com', 'users/');
  var posturl = Uri.http('seekerrook.pythonanywhere.com', 'users/post');
  final response = (await client.get(geturl)).body;
  debugPrint('got response');

  debugPrint('Response : ${response}');

  if (global_user.isEmpty) {
    debugPrint('EMPTY');

    // final data = jsonDecode(response);
    final data = (await json.decode(response))['data'];

    for (int i = 0; i < data.length; i++) {
      global_user["${data[i]["ID"]}"] = DonaidUser.fromJson(data[i]);
    }
  } else {
    debugPrint('! EMPTY');

    var response = [];
    for (var i in global_user.keys) {
      debugPrint('! ${global_user} , ${global_user[i]}');
      var ele = global_user[i]!.toDict();
      ele["ID"] = i;
      response.add(ele);
    }
    String result = jsonEncode({"data": response});
    await client.post(posturl,
        headers: {"Content-Type": "application/json"}, body: result);
    // file.writeAsString(result);
    // .fromJson(file.readAsString());
  }
  return "action";
}
