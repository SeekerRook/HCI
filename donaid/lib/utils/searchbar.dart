import 'package:donaid/main.dart';
import 'package:donaid/mymenu.dart';
import 'package:donaid/previous_page.dart';
import 'package:donaid/theme.dart';
import 'package:donaid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';


class SearchBar extends StatefulWidget {
  final String title;
  const SearchBar({

Key?key,
required this.title,

  }):super(key: key);

  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = [
    for (var v in global_action.keys) 
      ("$v^${global_action[v]!.title}^${global_user[global_action[v]!.organization]!.username}^${global_action[v]!.type}^${global_action[v]!.title.toLowerCase()}^${global_user[global_action[v]!.organization]!.username.toLowerCase()}^${global_action[v]!.type.toLowerCase()}${global_action[v]!.title.toUpperCase()}^${global_user[global_action[v]!.organization]!.username.toUpperCase()}^${global_action[v]!.type.toUpperCase()}")
  ];
  var items = <String>[];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }


void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }


@override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        child: Stack(
        children: [
          MainPage(),         
       Container(
        width: double.infinity,
        color: Color.fromARGB(177, 0, 0, 0),
        //  margin: EdgeInsets.all(20),
        //  padding: EdgeInsets.all(40),
        child: Column(        
           
          children: <Widget>[ 
             Padding(
            padding: const EdgeInsets.symmetric(vertical:40.0),
          ),          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(                
                onChanged: (value) {
                  filterSearchResults( value);
                },
                controller: editingController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search...",
                    hintStyle: TextStyle(color: maincolor),
                    labelStyle: TextStyle(color: maincolor),
                    
                 
                    // prefixIcon: Icon(Icons.search),
                    prefixIcon:IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) =>  MainPage()),
                    );
                      },
                   color:maincolor,
                     icon: Icon(Icons.arrow_back)
                     ),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var data = items[index].split('^');
                  return ListTile(
                    title: Text("'${data[1]}'",style: TextStyle(fontSize: 17, color: Colors.white),),
                    subtitle: Text('από \"${data[2]}\" -  ${data[3]} ',style: TextStyle(fontSize: 17, color: Colors.white),),
                    onTap: (() {                        Navigator.pop(context);
                        Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) =>  MainPage(pos:LatLng(global_action[data[0]]!.x,global_action[data[0]]!.y))),
                    );
                      
                    }),
                  );
                },
              ),
            ),
          ],
        ),
        ),
        ] //// children
        ),
      ),
       drawer: const MyDrawer(),
    );
  }
}