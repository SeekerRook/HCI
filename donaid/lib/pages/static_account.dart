import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:donaid/utils/data.dart';


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
  String ID;

  StaticProfilePage(this.ID, {super.key});
  @override
  _StaticProfilePageState createState() => _StaticProfilePageState();
}


//final TextEditingController orgcontroller= TextEditingController();
//final TextEditingController pswdcontroller= TextEditingController();
final TextEditingController contactcontroller= TextEditingController();
final TextEditingController infocontroller= TextEditingController();

class _StaticProfilePageState extends State<StaticProfilePage> {
 


  @override
  Widget build(BuildContext context) {
    var user = global_user[widget.ID];
    return Builder(
          builder: (context) =>  ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                StaticProfileWidget(
                  imagePath: user!.imageurl,
                  isEdit: true,
                  
                  onClicked: () async {},
                ),

                         

        Text(
          '\n\nContact\n',
        style: TextStyle(fontWeight: FontWeight.bold),),


        Text(
          contactcontroller.text+'\n\n',),

       
        Text(
          'Info\n',
        style: TextStyle(fontWeight: FontWeight.bold),
    
        ),

        Text(
          infocontroller.text+'\n\n',)
              ],
            ),
          );
  
  }
}

void BuildStatic (String ID){
  var user = global_user[ID];
  //pswdcontroller.text = "hahadethamehakareis";
 // orgcontroller.text = "Aimopetalio";
  contactcontroller.text = user!.contact;
  infocontroller.text = user.bio;

  }