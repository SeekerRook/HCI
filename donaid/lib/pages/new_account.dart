import 'dart:io';
import 'package:donaid/pages/loginpage.dart';
import 'package:donaid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

// var me = global_user[myID];
var defaultimg = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png";

class TextFieldWidget extends StatefulWidget {
  
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  

  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}


class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: widget.maxLines,
          ),
        ],
      );
}


class NewProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const NewProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}


class NewProfilePage extends StatefulWidget {
  @override
  _NewProfilePageState createState() => _NewProfilePageState();
}


final TextEditingController usernamecontroller= TextEditingController();
final TextEditingController pswdcontroller= TextEditingController();
final TextEditingController emailcontroller= TextEditingController();
final TextEditingController infocontroller= TextEditingController();
final TextEditingController contactcontroller= TextEditingController();


class _NewProfilePageState extends State<NewProfilePage> {
  // User user = UserPreferences.myUser;
// @override
//   void initState() {
//     super.initState();
//     bool _passwordVisible;
//     _passwordVisible = false;
//   }

  @override
  Widget build(BuildContext context) =>  Builder(
          builder: (context) =>  ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                NewProfileWidget(
                  imagePath: defaultimg,//me!.imageurl,
                  isEdit: true,
                  onClicked: () async {},
                ),
                
               
                const SizedBox(height: 24),
                TextField(
                  controller : usernamecontroller,
                  decoration: InputDecoration(
                labelText: "Username",
                
              ),
                ),

              const SizedBox(height: 24),
              TextField(
              obscureText: true,//This will obscure text dynamically
              controller : pswdcontroller,
              decoration: InputDecoration(
                labelText: "Password",
                
              ),
            ),

            
                const SizedBox(height: 24),
                TextField(
                  controller : emailcontroller,
                  decoration: InputDecoration(
                labelText: "Email",
                
              ),
                ),
               
               const SizedBox(height: 24),
                TextField(
                  minLines: 1,
                  maxLines: 5,
                  controller : contactcontroller,
                  decoration: InputDecoration(
                  labelText: "Contact",
                  ),
                ),

                const SizedBox(height: 24),
                TextField(
                  minLines: 1,
                  maxLines: 5,
                  controller : infocontroller,
                  decoration: InputDecoration(
                labelText: "Info",
                
              ),
                ),
Spacer(),
            TextButton(
            style: TextButton.styleFrom(),
               child: Text('Δημιουργία'),
            onPressed: () {
              var ID = "U${global_user.length+1}";
              var newuser = DonaidUser(username: usernamecontroller.text, 
              email: emailcontroller.text,
               password: pswdcontroller.text,
                contact: contactcontroller.text,
                 bio: infocontroller.text,
                  imageurl: defaultimg);
                  global_user[ID] = newuser;
              // global_user[ID]!.password= pswdcontroller.text;
              // global_user[ID]!.username= usernamecontroller.text;
              // global_user[ID]!.email= emailcontroller.text;
              // global_user[ID]!.bio= infocontroller.text;
              // global_user[ID]!.contact= contactcontroller.text;
              get_data();
         Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            },
           )

              ],
            ),
          );
  

}
void NewBuild (){
  // me = global_user[myID];

  // pswdcontroller.text = me!.password;
  // usernamecontroller.text = me!.username;
  // emailcontroller.text = me!.email;
  // infocontroller.text = me!.bio;
  // contactcontroller.text = me!.contact;

  pswdcontroller.text = "";
  usernamecontroller.text = "";
  emailcontroller.text = "";
  infocontroller.text = "";
  contactcontroller.text = "";

  }