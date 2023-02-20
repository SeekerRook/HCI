import 'package:flutter/material.dart';

Card MyActionCard() {
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
                  onPressed: () {},
                  // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                  style: ElevatedButton.styleFrom(
                      //primary: Colors.purple,
                      elevation: 15.0,
                      textStyle: const TextStyle()),
                  child: const Icon(Icons.qr_code),
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
