import 'package:flutter/material.dart';
import 'package:donaid/utils/action_card.dart';


Card ActionCard() {
  var heading = 'Name';
  var subheading = 'by Organization';
  var cardImage = NetworkImage(
      'https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.rcdrilling.com%2Fwp-content%2Fuploads%2F2013%2F12%2Fdefault_image_01-1024x1024-570x321.png&imgrefurl=http%3A%2F%2Fwww.rcdrilling.com%2Fwp-content%2Fuploads%2F2013%2F12%2F%3FMA&tbnid=SnP4az_cMMS8AM&vet=12ahUKEwiKpeWk4579AhWwSqQEHc91BLgQMygMegUIARD2AQ..i&docid=V_P_Wfc9FKxKOM&w=570&h=321&q=default%20image&ved=2ahUKEwiKpeWk4579AhWwSqQEHc91BLgQMygMegUIARD2AQ');
  var supportingText =
      '00/00/2000\nAddress 0, City\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ';
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 15),
            child: CircleAvatar(
              child: Icon(Icons.account_circle),
              backgroundColor: Colors.purple,
            ),
          ),
          ListTile(
            title: Text(heading),
            subtitle: Text(subheading),
            trailing: Icon(Icons.favorite_outline),
          ),
          Container(
            height: 200.0,
            child: Ink.image(
              image: cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(children: [
            Chip(
                label: Text("Category"),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(
                    color: Colors.grey.shade800,
                    width: 1,
                    style: BorderStyle.solid)),
            Chip(
                label: Text("Category"),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(
                    color: Colors.grey.shade800,
                    width: 1,
                    style: BorderStyle.solid))
          ]),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText),
          ),
          /* ButtonBar(
              children: [
                TextButton(
                  child: const Text('CONTACT AGENT'),
                  onPressed: () {/* ... */},
                ),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {/* ... */},
                )
              ],
            )*/
        ],
      ));
}

class DonationsPage extends StatelessWidget {
  const DonationsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const Center(
      child: Text("Donations"),
    );
=======
    return 
    Scaffold(
    body: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ActionCard(),
                  ActionCard(),
                  ActionCard(),                 
                ],
              )),
    )
    ); 
>>>>>>> 3c2d916db551488c7410a4d27851bad3b7d6ffd0
  }
}

FloatingActionButton donfab =
    FloatingActionButton(onPressed: () => {}, child: const Icon(Icons.qr_code));
