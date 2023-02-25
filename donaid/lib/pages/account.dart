import 'dart:io';
import 'package:donaid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

var me = global_user[myID];

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
                  imagePath: me!.imageurl,
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
               child: Text('Διαγραφη λογαριασμού'),
            onPressed: () {
            //  showDialog(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //       content: Text(
            //           'Ο λογαριασμός διαγράφηκε'),
            //     ),
            //   );

//  if (data.organization == myID){
              showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:Text(
                              "Είστε σίγουροι ότι θέλετε να διαγράψετε το λογαριασμό σας;"),
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
                              showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                              content: Text(
                                  'Ο λογαραισμός διαγράφηκε με επιτυχία.'),
                              ),
              );
                            },
                          ),
                          ]
                          )
                        //  ]
                        // )
                        ],
                      ),
                    ),
                  );
//  }

            },
           )

              ],
            ),
          );
  

}
void Build (){
  me = global_user[myID];

  pswdcontroller.text =me!.password;
  usernamecontroller.text = me!.username;
  emailcontroller.text = me!.email;
  infocontroller.text = me!.bio;
  contactcontroller.text = me!.contact;

  }