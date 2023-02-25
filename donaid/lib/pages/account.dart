import 'dart:io';
import 'package:donaid/pages/loginpage.dart';
import 'package:donaid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

var me = global_user[myID];
var defaultimg =
    "https://st3.depositphotos.com/6672868/13701/v/600/depositphotos_137014128-stock-illustration-user-profile-icon.jpg";
var selected_image = me!.imageurl;

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

class ProfileWidget extends StatefulWidget {
  final String imagePath;
  final bool isEdit;
  var onClicked;

  ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  _ProfileWidget createState() => _ProfileWidget();
}

class _ProfileWidget extends State<ProfileWidget> {
  String _img = "";
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
            // child: buildEditIcon(color),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius:
                        //         BorderRadius.circular(50.0)), //this right here
                        child: Container(
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  onChanged: ((value) {
                                    try {
                                      var img = NetworkImage(value);
                                      // defaultimg = value;
                                      setState(() {
                                        _img = value;
                                      });
                                    } catch (e) {
                                      setState(() {
                                        _img = _img;
                                      });
                                    }
                                  }),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Paste image link...'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).then((value) {
                      selected_image = _img;//weu-az-mfv-live-cdnep.azureedge.net/mediacontainer/medialibraries/myfamilyvets/my-family-vets/articles-2020/labrador-hero.jpg?ext=.jpg
                    });
              },
              icon: const Icon(
                Icons.add_a_photo,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    if (_img == "") _img = global_user[myID]!.imageurl;
    final image = NetworkImage(_img);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: widget.onClicked),
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
            widget.isEdit ? Icons.add_a_photo : Icons.edit,
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

final TextEditingController usernamecontroller = TextEditingController();
final TextEditingController pswdcontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController infocontroller = TextEditingController();
final TextEditingController contactcontroller = TextEditingController();

class _EditProfilePageState extends State<EditProfilePage> {
  // User user = UserPreferences.myUser;
// @override
//   void initState() {
//     super.initState();
//     bool _passwordVisible;
//     _passwordVisible = false;
//   }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => ListView(
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
              controller: usernamecontroller,
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              obscureText: true, //This will obscure text dynamically
              controller: pswdcontroller,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              minLines: 1,
              maxLines: 5,
              controller: contactcontroller,
              decoration: InputDecoration(
                labelText: "Contact",
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              minLines: 1,
              maxLines: 5,
              controller: infocontroller,
              decoration: InputDecoration(
                labelText: "Info",
              ),
            ),
            Spacer(),
            TextButton(
                style: TextButton.styleFrom(),
                child: Text('Αποθήκευση αλλαγών'),
                onPressed: () {
                // var ID = "U${global_user.length + 1}";
                var newuser = DonaidUser(
                    username: usernamecontroller.text,
                    email: emailcontroller.text,
                    password: pswdcontroller.text,
                    contact: contactcontroller.text,
                    bio: infocontroller.text,
                    imageurl: selected_image);
                global_user[myID] = newuser;
                debugPrint(selected_image);
                // global_user[ID]!.password= pswdcontroller.text;
                // global_user[ID]!.username= usernamecontroller.text;
                // global_user[ID]!.email= emailcontroller.text;
                // global_user[ID]!.bio= infocontroller.text;
                // global_user[ID]!.contact= contactcontroller.text;
                get_data().then((value) {
                                   showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(
                          'Οι αλλαγές αποθηκεύτηκαν!'),
                    ),
                  );

                });
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );                  
                }),
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
                    title: Text(
                        "Είστε σίγουροι ότι θέλετε να διαγράψετε το λογαριασμό σας;"),
                    content: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                child: Text("Ακύρωση"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text("Διαγραφή"),
                                onPressed: () {
                                  global_user.remove(myID);
                                  for (var v in global_action.keys) {
                                    if (global_action[v]!.organization ==
                                        myID) {
                                      global_action.remove(v);
                                    }
                                  }
                                  myID = "";
                                  get_data();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                },
                              ),
                            ])
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

void Build() {
  me = global_user[myID];

  pswdcontroller.text = me!.password;
  usernamecontroller.text = me!.username;
  emailcontroller.text = me!.email;
  infocontroller.text = me!.bio;
  contactcontroller.text = me!.contact;
  // contactcontroller.text = me!.contact;
}
