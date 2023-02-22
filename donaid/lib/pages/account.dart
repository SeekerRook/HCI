import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


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


class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
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


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}


final TextEditingController usernamecontroller= TextEditingController();
final TextEditingController pswdcontroller= TextEditingController();
final TextEditingController emailcontroller= TextEditingController();
final TextEditingController infocontroller= TextEditingController();
final TextEditingController contactcontroller= TextEditingController();


class _EditProfilePageState extends State<EditProfilePage> {
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
                ProfileWidget(
                  imagePath: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/271deea8-e28c-41a3-aaf5-2913f5f48be6/de7834s-6515bd40-8b2c-4dc6-a843-5ac1a95a8b55.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI3MWRlZWE4LWUyOGMtNDFhMy1hYWY1LTI5MTNmNWY0OGJlNlwvZGU3ODM0cy02NTE1YmQ0MC04YjJjLTRkYzYtYTg0My01YWMxYTk1YThiNTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.BopkDn1ptIwbmcKHdAOlYHyAOOACXW0Zfgbs0-6BY-E",
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
                  readOnly: true,
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                      'You have deleted your account. Goodbye!'),
                ),
              );
            },
            child: Text('Delete account'),
            )

              ],
            ),
          );
  

}
void Build (){
  pswdcontroller.text = "hahadethamehakareis";
  usernamecontroller.text = "Vasileia";
  emailcontroller.text = "ntalianiv@gmail.com";
  infocontroller.text = "I am an undergraduate student at ECE NTUA";
  contactcontroller.text = "-";

  }