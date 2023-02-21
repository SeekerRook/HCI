import 'package:flutter/material.dart';
import 'package:donaid/utils/data.dart';

Card ActionCard() {
  var data = get_data();
  var heading = data.title;
  var subheading = 'από "' + data.organization + '"';
  var cardImage = NetworkImage(

      'https://diotima.org.gr/wp-content/uploads/2020/02/Diotima-Donation-02.jpg');
  var supportingText =   data.date + '\n\n' + data.place + '\n\n'+ data.description;

  // '00/00/2000\nAddress 0, City\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ';
  return Card(
      elevation: 4.0,
      child: Column(
        children: [
          // Container(
          //   alignment: Alignment.topCenter,
          //   margin: EdgeInsets.only(top: 15),
          //   child: CircleAvatar(
          //       child: Icon(Icons.account_circle),
          //       backgroundColor: Colors.purple,
          //     ),
          // ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(heading),
            subtitle: Text(subheading),
            trailing: const Icon(Icons.favorite_outline),
          ),
          Container(
            height: 175.0,
            child: Ink.image(
              image: cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(children: [
            SizedBox(
              width: 10,
            ),

            Chip(
                label: Text("Αιμοδοσία"),
                // backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(
                    color: Colors.grey.shade800,
                    width: 1,
                    style: BorderStyle.solid)),
            SizedBox(
              width: 5,
            ),


            // Chip(
            //   label: Text(""),
            //   // backgroundColor: Colors.white,
            //   shape: RoundedRectangleBorder (
            //          borderRadius: BorderRadius.circular(5.0),
            //   ),
            //   side: BorderSide(
            //     color: Colors.grey.shade800,
            //     width: 1,
            //     style: BorderStyle.solid
            //   )
            // ),
          ]),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(supportingText,style: const TextStyle(   height: 0.8 ),),
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

// }
