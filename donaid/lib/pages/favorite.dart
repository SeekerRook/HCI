import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget{
  const FavoritePage({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Text("Favorites"),
    );
  }
  }
FloatingActionButton favfab = FloatingActionButton(onPressed: ()=>{},
    child: const Icon(Icons.qr_code)
);