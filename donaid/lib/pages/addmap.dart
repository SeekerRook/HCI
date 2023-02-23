import 'package:flutter/material.dart';
//import 'package:donaid/utils/action_card.dart';

class AddMapPage extends StatelessWidget {
  const AddMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Νέος χάρτης'),
      // ),
      body: Center(
        child: const Text('New map'),
        // ElevatedButton(
          // child: const Text('New map'),
          // onPressed: () {
          //   // Navigate to second route when tapped.
          // },
        // ),
      ),
    );
  }
}