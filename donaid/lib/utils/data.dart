import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DonaidAction {
  DonaidAction(
      {required this.title,
      required this.organization,
      required this.date,
      required this.place,
      required this.x,
      required this.y,
      required this.description});
  final String title;
  final String organization;
  final String date;
  final String place;
  final double x;
  final double y;
  final String description;

  factory DonaidAction.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    final title = data['title'] as String;
    final organization = data['organization'] as String;
    final date = data['date'] as String;
    final place = data['place'] as String;
    final x = data['x'] as double;
    final y = data['y'] as double;
    final description = data['description'] as String;

    return DonaidAction(
      title: title,
      organization: organization,
      date: date,
      place: place,
      x: x,
      y: y,
      description: description,
    );
  }
}



get_data() {
    final response = "{\"title\": \"Εθελοντική Αιμοδοσία\",\"organization\": \"Αιμοπετάλιο\", \"place\": \"Πλατεία Συντάγματος\",\"date\": \"25/12/2023\",\"x\": 37.97531039553379,\"y\":  23.73562607771404,\"description\": \"Αυτά τα Χριστουγεννα δώρισε αίμα σε όσους το έχουν ανάγκη\"}";
    final data = jsonDecode(response);
    debugPrint('${ data[' title']}');
    
    final action = DonaidAction.fromJson(data);
    return action;
}

    

