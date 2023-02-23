import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' ;
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

Map<String, DonaidAction> global_action =
    Map<String, DonaidAction>(); //List<DonaidAction>(
//   title: "",
//   organization: "",
//   date: "",
//   place: "",
//   x: 0.0,
//   y: 0.0,
//   description: "",
//   imgpath: "",
// hasDonated: false,
// isFavorite: false,
// type: "",
// );

// Future<String> _get_data() async {
//   final String response = await rootBundle.loadString('assets/data/actions.json');
// // final data = await json.decode(response);
//   debugPrint('Response : ${response}');

//   final data =  jsonDecode(response);
//   debugPrint('TITLE : ${data["title"]}');
//   global_action =  DonaidAction.fromJson(data);
//    return "action";
// }

// DonaidAction  get_data() {
//   //  DonaidAction res = DonaidAction(
//   //   title: "",
//   //     organization: "",
//   //     date: "",
//   //     place: "",
//   //     x: 0.0,
//   //     y: 0.0,
//   //     description: "",);
//   //   // DonaidAction res;
//     debugPrint('ASYNC');

//     Future<void> action = _get_data();
//     action.then((value) {debugPrint(global_action.title);  })
//       .catchError((error) => debugPrint(error.toString()));
//     return global_action;
// }

// //   final response =
//       "{\"title\": \"Εθελοντική Αιμοδοσία\",\"organization\": \"Αιμοπετάλιο\", \"place\": \"Πλατεία Συντάγματος\",\"date\": \"25/12/2023\",\"x\": 37.97531039553379,\"y\":  23.73562607771404,\"description\": \"Αυτά τα Χριστουγεννα δώρισε αίμα σε όσους το έχουν ανάγκη\"}";
//   final data = jsonDecode(response);
//   debugPrint('${data[' title']}');

//   final action = DonaidAction.fromJson(data);
//   return action;
// }
var client = Client();
Future<String> get_data_() async {
  
  var url = Uri.http('seekerrook.pythonanywhere.com', 'actions/');
  final  response = (await client.get(url)).body;
  debugPrint('got response');

  debugPrint('Response : ${response}');

  if (global_action.isEmpty) {
    // final data = jsonDecode(response);
  final data = (await json.decode(response))['data'];

    for (int i = 0; i < data.length; i++) {
    debugPrint('Data : ${data}');

      global_action["${data[i]["ID"]}"] = DonaidAction.fromJson(data[i]);
    }
  } else {
    var response = [];
    for (int i = 0; i < global_action.length; i++) {
      response.add(global_action[i]?.toDict());
    }
    String result = jsonEncode(response);

    // file.writeAsString(result);
    // .fromJson(file.readAsString());
  }
  return "action";
}
