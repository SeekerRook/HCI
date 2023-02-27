import 'package:donaid/previous_page.dart';
import 'package:donaid/theme.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
 // final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
       appBar: AppBar(
          leading: previouspage,
          // backgroundColor: maincolor,
          foregroundColor: textpurple,
          title: Text("Ανάκτηση κωδικού"),
          ),
       body: Center(
        child:Column(
      children:[ 
        
        Padding(
        padding: EdgeInsets.all(20.0),
        child:
      Text("Εάν έχετε ξεχάσει τον κωδικό σας, συμπληρώστε παρακάτω το email σας και θα σας αποστείλουμε έναν νέο προσωρινό κωδικό. Μπορείτε να χρησιμοποιήσετε αυτόν τον κωδικό για να εισέλθετε στην εφαρμογή και στην συνέχεια να ορίσετε έναν νέο κωδικό για τον λογαριασμό σας. "),),
      //)
      Padding(padding: 
      EdgeInsets.all(20.0)),

      const SizedBox(
       height: 100, 
       width:300,
       child:  TextField(
            decoration: 
            InputDecoration(
            labelText: 'email',
           // hintText: 'email',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
          ),
          )
),

// Spacer(),
TextButton(
  child: Text('Αποστολή κωδικού'),
  onPressed: () {
    showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Επιτυχής αποστολή κωδικού.\n Ελέγξτε το email σας.' )
                    ));
  }
  )
      ]
       ),
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