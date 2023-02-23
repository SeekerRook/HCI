
import 'package:flutter/material.dart';
import 'package:donaid/utils/data.dart';
import 'package:donaid/main.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActionCard extends StatefulWidget {
   String ID;

   ActionCard(this.ID,{super.key});
@override
  _ActionCardState createState() => _ActionCardState();
}

bool _isFavorited = false; 
class _ActionCardState extends State<ActionCard> {
  // var data ;
  // @override
  // void initState(){
   
  //   super.initState();
  // }


Future<String> load_data() async {
  get_data();
  return "something";
}
@override
  Widget build(BuildContext context) {
   return  FutureBuilder(
          future:  get_data(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Container();//Center(child: CircularProgressIndicator());
            else if (snapshot.connectionState == ConnectionState.done){
  var data=global_action[widget.ID];
  debugPrint('${data}');

  var heading = data!.title;
  var subheading = 'από "${data.organization}"';
  var cardImage = NetworkImage(

      data.imgpath);
  var supportingText =   data.date + '\n\n' + data.place + '\n\n'+ data.description;

  // '00/00/2000\nAddress 0, City\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ';
  return Card(
      elevation: 4.0,
      child: Column(
        children: [

          ListTile(
            // leading: const Icon(Icons.account_circle),
            leading:IconButton(
          icon: const Icon(Icons.account_circle),
          // tooltip: 'Increase volume by 10',
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StaticAccount()),
            );
          }
          ),
            title: Text(heading),
            subtitle: Text(subheading),
            // trailing: const Icon(Icons.favorite_outline),
         trailing: IconButton(
              onPressed: () => {
                  setState(() => data.isFavorite = !data.isFavorite) },
              icon: data.isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: (data.isFavorite)
                                ? Colors.red
                                : Colors.black12),

         
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


            else
              return Container();
          }); 
  
  // var data = get_data();

}

 

 }


Future<String> get_data() async {
  var res =  get_data_();
   get_users_();
return res;
 
//   final String response = await rootBundle.loadString('assets/data/actions.json');
// // final data = await json.decode(response);
//   debugPrint('Response : ${response}');

//   final data =  jsonDecode(response);
//   for (int i = 0; i< data.length; i++){
//   debugPrint('ID : ${data[i]["ID"]}');
//   global_action ["${data[i]["ID"]}"] =   DonaidAction.fromJson(data[i]);
//   }
//   debugPrint('${global_action}');


//    return "action";
}

