import 'package:donaid/pages/mappage.dart';
import 'package:donaid/pages/qr.dart';
import 'package:donaid/theme.dart';
import 'package:flutter/material.dart';
import 'package:donaid/utils/data.dart';
import 'package:donaid/main.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlng/latlng.dart';

class ActionCard extends StatefulWidget {
  String ID;

  ActionCard(this.ID, {super.key});
  @override
  _ActionCardState createState() => _ActionCardState();
}

bool _isFavorited = false;

class _ActionCardState extends State<ActionCard> {


  @override
  Widget build(BuildContext context) {
            
            var data = global_action[widget.ID];
            debugPrint('${data}');

            var heading = data!.title;
            var subheading = 'από "${global_user[data.organization]!.username}"';
            // debugPrint('\n\nAPO   ${}\n\n');
            var cardImage = NetworkImage(data.imgpath);
            
            var supportingText =
                data.date + '\n\n' + data.place + '\n\n' + data.description;

              
            Widget button = (data.organization == myID)? ElevatedButton(
              // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
              style: ElevatedButton.styleFrom(
                  //primary: Colors.purple,
                  elevation: 15.0,
                  textStyle: const TextStyle()),
              child: const Icon(Icons.qr_code),

              onPressed: () => {
                if (data.organization == myID)
                  {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=${widget.ID}',
                              // height: 200,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  }
              },
            ): Container();

Widget deletebutton = (data.organization == myID)
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle()),
            child: const Icon(Icons.delete),

            onPressed: () => {
              if (data.organization == myID)
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:Text(
                              "Είστε σίγουροι ότι θέλετε να διαγράψετε τη συγκεκριμένη δράση;"),
                      content: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                           Row (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[TextButton(
                            child: Text("Ακύρωση"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text("Διαγραφή"),
                            onPressed: () {
                                global_action.remove(widget.ID);
                                get_data().then((value) {
                                                                showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                              content: Text(
                                  'Η δράση διαγράφηκε με επιτυχία.'),
                              ),
              ).then((value){
                Navigator.pop(context);
              
              });
                                });
                            },
                          ),
                          ]
                          )
                        //  ]
                        // )
                        ],
                      ),
                    ),
                  ),

                  //   AlertDialog(
                  //   content: Image.asset('https://www.everypixel.com/q/funny-dogs%27)
                  // ),
                }
            },
          )
        : Container();





            // '00/00/2000\nAddress 0, City\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ';
            return Card(

                elevation: 4.0,
                
                child: Column(
                  children: [
                    ListTile(
                      // leading: const Icon(Icons.account_circle),
                      leading: IconButton(
                          icon: const Icon(Icons.account_circle),
                          color: textpurple,
                          onPressed: () {
                            // Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  StaticAccount(data.organization)),
                            );
                          }),
                      title: GestureDetector(
                        child: Text(heading, style: TextStyle(foreground: Paint()..color = textpurple)),
                      onTap: () {
                        // if (context.)
                          final navstate= Navigator.of(context);
                          // final currentStack = navstate;

                          debugPrint('${data.x}, ${data.y}');
                            // Navigator.pop(context);
                            // Navigator.of(context).popUntil((route) => route.toString() != "");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  MainPage(pos: LatLng(data.x,data.y))),
                            );
                          },),
                      subtitle: Text(subheading),
                      // trailing: const Icon(Icons.favorite_outline),
                      trailing: IconButton(
                          onPressed: () => {
                                setState(
                                    () => data.isFavorite = !data.isFavorite)
                              },
                          icon: data.isFavorite
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                          color:
                              (data.isFavorite) ? Colors.red : Colors.black12),
                    ),
                    Container(
                      height: 160.0,
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
                          label: Text(data.type),
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

                          Spacer(),

                      button,
                      deletebutton,

                      SizedBox(
                        width: 10,
                      ),
                    ]),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerLeft,
                      // child: Padding(
                      //   padding: EdgeInsets.symmetric(vertical:25.0),
                      child: Text(
                        supportingText,
                        style: const TextStyle(height: 1),
                      ),
                    // )
                    ),
                  ],
                ));
  }
}


