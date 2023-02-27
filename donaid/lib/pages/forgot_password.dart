import 'package:donaid/previous_page.dart';
import 'package:donaid/theme.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
 // final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: previouspage,
          backgroundColor: maincolor,
          foregroundColor: textpurple,
          title: Text("Ανάκτηση κωδικού"),
          ),
       body: 
       Padding(
        padding: EdgeInsets.all(6.0),
        child:Text("Εάν έχετε ξεχάσει τον κωδικό σας, συμπληρώστε παρακάτω το email σας και θα σας αποστείλουμε έναν νέο προσωρινό κωδικό. Μπορείτε να χρησιμοποιήσετε αυτον τον κωδικό για να εισέλθετε στην εφαρμογή και στην συνέχεια να ορίσετε έναν νέο κωδικό για τον λογαριασμό σας. "),
      )
      );
      // body: Center(
        // child: TextButton(
        //   onPressed: () {},
        //   child: const Text('Next'),
        // ),
      // ),
    // );
   
  }
}