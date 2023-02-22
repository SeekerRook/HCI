import 'dart:io';
import 'package:flutter/material.dart';


class MyActionCard extends StatefulWidget {
  const MyActionCard({super.key});
@override
  _MyActionCardState createState() => _MyActionCardState();
}

bool _isFavorited = false; 
class _MyActionCardState extends State<MyActionCard> {

  @override
  Widget build(BuildContext context) {

    var heading = 'Name';
    var subheading = 'by Organization';
    var cardImage = NetworkImage(
    'https://diotima.org.gr/wp-content/uploads/2020/02/Diotima-Donation-02.jpg');
    var supportingText =
        '00/00/2000\nAddress 0, City\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ';
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
                  // trailing: const Icon(Icons.favorite_outline),
                  trailing: IconButton(
              onPressed: () => {
                  setState(() => _isFavorited = !_isFavorited) },
              icon: _isFavorited
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: (_isFavorited)
                                ? Colors.red
                                : Colors.black12),
                )
              ,
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              
             children: [
                SizedBox(width: 10,),

                Chip(
                  label: Text("Category"),
                  // backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder (
                         borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide(
                    color: Colors.grey.shade800, 
                    width: 1, 
                    style: BorderStyle.solid
                  )
                ),
               
                SizedBox(width: 5,),
                Chip(
                  label: Text("Category"),
                  // backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder (
                         borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide(
                    color: Colors.grey.shade800, 
                    width: 1, 
                    style: BorderStyle.solid
                  )
                ),   



                Spacer(),

                ElevatedButton(

                  // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                  style: ElevatedButton.styleFrom(
                      //primary: Colors.purple,
                      elevation: 15.0,
                      textStyle: const TextStyle()),
                  child: const Icon(Icons.qr_code),


                  onPressed: () => {showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=DON41D_asdf',
                      // height: 200,
                      fit: BoxFit.cover,
                    ),
                   
                  ],
                ),
              ),
            ),

                //   AlertDialog(
                //   content: Image.asset('https://www.everypixel.com/q/funny-dogs')
                // ),
                 },
                ),
              
                SizedBox(width: 10,),
             
             ]
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText, overflow:TextOverflow.ellipsis),
            ),

          ],
        ));
  }
// }
}