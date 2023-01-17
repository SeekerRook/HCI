import 'package:flutter/material.dart';
const maincolor = const Color(0xffeaddff); 
const textblack = const Color(0xff1C1B1F); 

ThemeData mytheme = 
  ThemeData(
     primaryColor: maincolor,
  
    floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: maincolor,
    foregroundColor: textblack
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: maincolor
      
      )
  
);

