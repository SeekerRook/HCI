import 'package:donaid/pages/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:donaid/main.dart';
import 'package:donaid/theme.dart';
import 'package:donaid/utils/data.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
final TextEditingController mailcontroller= TextEditingController();
final TextEditingController pswdcontroller= TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {
    debugPrint("%_LOGIN PAGE START!");
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        // title: Text("Welcome to DonAid"),
        title:Center(
        child: Text(
          "DonAid",
          textAlign: TextAlign.center,
          style: TextStyle(color: textlightpurple),
          //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
        ),
      ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,   
                                   
                    child: Image.asset('assets/icon.png')),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextField(
                controller: mailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: pswdcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '??????????????',
                 ),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: TextButton(
                child: Text('???????????? ?????? ???????????? ??????',style: TextStyle(color: pincolor, fontSize: 15),),
                onPressed: (){
                  //Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                },
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: pincolor, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  for (var k in global_user.keys)
                    if (mailcontroller.text == global_user[k]!.email && pswdcontroller.text == global_user[k]!.password   ) {
                      myID = k;
                      get_data();
  Navigator.pop(context);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MainPage()));
                    }
                
                },
                child: Text(
                  '??????????????',
                  style: TextStyle(color: secondarycolor, fontSize: 25),
                ),
              ),
            ),
          
           Text(
          '\n\n"?? DonAid ?????????? ?????? ?????? ???? ???? ???????????????? ???? ??????????????????"',
        style: TextStyle(fontStyle: FontStyle.italic,color: textpurple,fontSize: 15),),
        





            TextButton(
                            child: Text("???????????????????? ??????????????????????"),
                            onPressed: () {
            
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewAccount()),
            );
                            },
                          ),
          ],
        ),
      ),
    );
  }
}