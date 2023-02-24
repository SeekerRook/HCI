import 'package:donaid/main.dart';
import 'package:donaid/mymenu.dart';
import 'package:donaid/previous_page.dart';
import 'package:donaid/theme.dart';
import 'package:flutter/material.dart';


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

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
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
                  
                },
                controller: editingController,
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
                      MaterialPageRoute(builder: (context) => const MainPage()),
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
                  return ListTile(
                    title: Text('${items[index]}',style: TextStyle(fontSize: 25, color: Colors.white),),
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