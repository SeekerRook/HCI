import 'package:flutter/material.dart';
import 'package:donaid/main.dart';
import 'package:donaid/theme.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        // title: Text("Welcome to DonAid"),
        title:Center(
        child: Text(
          "DonAid",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 85, 5, 99)),
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
                                   
                    child: Image.network('https://www.coastaldiscos.co.uk/wp-content/uploads/2017/03/pin-purple.png')),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
              //      hintText: 'Enter email id as mail@gmail.com'
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
//                    hintText: 'Enter secure password'
                 ),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: pincolor, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: pincolor, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: secondarycolor, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Text('Sign up')
          ],
        ),
      ),
    );
  }
}