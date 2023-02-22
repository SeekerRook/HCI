import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


class StaticTextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const StaticTextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _StaticTextFieldWidgetState createState() => _StaticTextFieldWidgetState();
}

class _StaticTextFieldWidgetState extends State<StaticTextFieldWidget> {
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


class StaticProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const StaticProfileWidget({
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


class StaticProfilePage extends StatefulWidget {
  @override
  _StaticProfilePageState createState() => _StaticProfilePageState();
}


final TextEditingController usernamecontroller= TextEditingController();
final TextEditingController pswdcontroller= TextEditingController();
final TextEditingController emailcontroller= TextEditingController();
final TextEditingController biocontroller= TextEditingController();

class _StaticProfilePageState extends State<StaticProfilePage> {
 


  @override
  Widget build(BuildContext context) =>  Builder(
          builder: (context) =>  ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                StaticProfileWidget(
                  imagePath: "https://wallpapers.com/images/hd/cute-girl-vector-art-profile-picture-jhbu3wt713zj2bti.jpg",
                  isEdit: true,
                  onClicked: () async {},
                ),
                
                const SizedBox(height: 24),
                TextField(                  
                  controller : usernamecontroller,
                  readOnly: true,
                  decoration: InputDecoration(              
                labelText: "Username",               
              ),
                ),

             

              const SizedBox(height: 24),
              TextField(
              obscureText: true,
              controller : pswdcontroller,
              readOnly: true,
              decoration: InputDecoration(
              labelText: "Password",
              ),
            ),

            
                const SizedBox(height: 24),
                TextField(
                  controller : emailcontroller,
                  readOnly: true,
                  decoration: InputDecoration(
                  labelText: "Email",
                  ),
                ),
               
               
                const SizedBox(height: 24),
                TextField(
                  controller : biocontroller,
                  readOnly: true,
                  decoration: InputDecoration(
                labelText: "Bio",
              ),
                ),
              ],
            ),
          );
  

}

void BuildStatic (){
  pswdcontroller.text = "hahadethamehakareis";
  usernamecontroller.text = "Vasileia";
  emailcontroller.text = "ntalianiv@gmail.com";
  biocontroller.text = "I am an undergraduate student at ECE NTUA";

  }