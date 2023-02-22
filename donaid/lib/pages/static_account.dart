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


//final TextEditingController orgcontroller= TextEditingController();
//final TextEditingController pswdcontroller= TextEditingController();
final TextEditingController contactcontroller= TextEditingController();
final TextEditingController infocontroller= TextEditingController();

class _StaticProfilePageState extends State<StaticProfilePage> {
 


  @override
  Widget build(BuildContext context) =>  Builder(
          builder: (context) =>  ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                StaticProfileWidget(
                  imagePath: "https://images-ext-2.discordapp.net/external/QJu037WHfI_pq95d1gg46OEvK0X7r_i4Lv0yBlHFTnM/%3F_nc_cat%3D104%26ccb%3D1-7%26_nc_sid%3D09cbfe%26_nc_ohc%3DU7ioUpjI1H0AX_CfzQ5%26_nc_ht%3Dscontent.fath4-2.fna%26oh%3D00_AfACS5LF8rb8MVvRPoFWty0bXw3KIzSOXbLecCa1eYSH2g%26oe%3D63FAA888/https/scontent.fath4-2.fna.fbcdn.net/v/t39.30808-6/325979872_1388081398611609_2589098736076340159_n.jpg?width=670&height=664",
                  isEdit: true,
                  onClicked: () async {},
                ),
                
              //   const SizedBox(height: 24),
              //   TextField(                  
              //     controller : orgcontroller,
              //     readOnly: true,
              //     decoration: InputDecoration(              
              //   labelText: "Organization",               
              // ),
              //   ),

             

            //   const SizedBox(height: 24),
            //   TextField(
            //   obscureText: true,
            //   controller : pswdcontroller,
            //   readOnly: true,
            //   decoration: InputDecoration(
            //   labelText: "Password",
            //   ),
            // ),

            
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
                  maxLines: 10,
                  controller : infocontroller,
                  readOnly: true,
                  decoration: InputDecoration(                  
                labelText: "Info",
              ),
                ),
              ],
            ),
          );
  

}

void BuildStatic (){
  //pswdcontroller.text = "hahadethamehakareis";
 // orgcontroller.text = "Aimopetalio";
  contactcontroller.text = "https://aimopetalio.med.uoa.gr/";
  infocontroller.text = "Το Αιμοπετάλιο επιδιώκει τη διάδοση της ιδέας της εθελοντικής αιμοδοσίας. Κύρια δράση του είναι η διοργάνωση εθελοντικών αιμοδοσιών σε χώρους του πανεπιστημίου, σε συνεργασία με το Ε.ΚΕ.Α. Συνήθως διοργανώνονται δυο αιμοδοσίες σε κάθε ακαδημαϊκό εξάμηνο, ένα διήμερο στην Ιατρική Σχολή και ένα διήμερο/τριήμερο στην Πανεπιστημιούπολη!";

  }