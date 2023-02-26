import 'package:donaid/main.dart';
import 'package:donaid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:donaid/utils/action_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> favorites = [];
    for (var v in global_action.keys) {
      if (global_action[v]!.isFavorite) favorites.add(ActionCard(v));
    }
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: RefreshIndicator(
              onRefresh: (() async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorites()),
                );
              }),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: favorites //[
                      //   ActionCard("D1"),
                      //   ActionCard("D2"),
                      //   // ActionCard(),
                      // ],
                      )),
            )));
  }
}
// FloatingActionButton favfab = FloatingActionButton(onPressed: ()=>{},
//     child: const Icon(Icons.search)
// );

// Future<String> get_data() async {
//   return get_data_();

// }
