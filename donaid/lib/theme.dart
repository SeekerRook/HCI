import 'package:flutter/material.dart';
const maincolor = const Color(0xffeaddff); 
const secondarycolor = const Color(0xfffffbfe); 
const textblack = const Color(0xff1C1B1F); 
const textpurple = const Color(0xff21005D); 
const texlightpurple = const Color(0xff6750A4); 

ThemeData mytheme = 
  ThemeData(
     primaryColor: maincolor,
  
    floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: maincolor,
    foregroundColor: textpurple
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: maincolor,
      // iconTheme: IconThemeData(color: textpurple)
      
      
      )
            
  
);

