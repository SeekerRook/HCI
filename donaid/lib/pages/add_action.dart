import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';



class TextFieldWidgetAct extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidgetAct({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetActState createState() => _TextFieldWidgetActState();
}

class _TextFieldWidgetActState extends State<TextFieldWidgetAct> {
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

class ActionWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ActionWidget({
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

    return ClipRect(

   
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          // width: 128,
          height: 200,
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

class AddActionPage extends StatefulWidget {
  @override
  _AddActionPageState createState() => _AddActionPageState();
}

var _controllerT = TextEditingController();
var _controllerC = TextEditingController();

TextEditingController startdateController= TextEditingController();
TextEditingController enddateController= TextEditingController();
  final TextEditingController _controller = new TextEditingController();
  


class _AddActionPageState extends State<AddActionPage> {

bool _switchValue = false;
var items = ['Τρόφιμα', 'Φάρμακα', 'Αιμοδοσία', 'Αδέσποτα'];

// var items = <your call to api>;
@override
void initState(){
  super.initState();
  startdateController.text="";
  enddateController.text = "";
}

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),          
          children: [
            ActionWidget(
              imagePath:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png",
              isEdit: true,
              onClicked: () async {},
            ),

            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Τίτλος",
              ),
              onChanged: (title) {},
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Περιγραφή",
              ),
              onChanged: (description) {},
            ),

            const SizedBox(height: 24),
            TextFormField(
              controller: _controllerT,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: _controllerT.clear,
                  icon: Icon(Icons.clear),
                ),
                labelText: "Τοποθεσία",
              ),
              onChanged: (location) {},
            ),
            
            // const SizedBox(height: 24),
            // TextFormField(
            //   enabled: _switchValue,
            //   decoration: InputDecoration(
            //     labelText: "Ημερομηνία",
            //     hintText: 'dd/mm/yyyy'
            //   ),
            //   onChanged: (date) {},
            // ),

           Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
 
    const SizedBox(width: 20.0, height: 24,),
     Flexible(  
      child:  TextFormField(
        enabled: _switchValue,
        controller: startdateController,
          decoration: InputDecoration(
            //  contentPadding: EdgeInsets.all(10),
              labelText: "Start date",
              icon: Icon(Icons.calendar_today),
              
          ),
          readOnly: true,
          onTap: () async {
                  //when click we have to show the datepicker
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                       initialDate: DateTime.now(), //get today's date
                      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                    if(pickedDate != null ){
                     // print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                     // print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                      setState(() {
                          startdateController.text = formattedDate; //set foratted date to TextField value. 
                        //startdateController.text = pickedDate.toString();
                      });
                  }else{
                      print("Date is not selected");
                  }
            }
        
      ),
      
    ),
    const SizedBox(width: 20.0, height: 24,),
     Flexible(
      child: TextFormField(
        enabled: _switchValue,
        controller: enddateController,
          decoration: InputDecoration(
            //  contentPadding: EdgeInsets.all(10),
              labelText: "End date",
              icon: Icon(Icons.calendar_today),
          ),
          readOnly: true,
          onTap: () async {
                  //when click we have to show the datepicker
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                       initialDate: DateTime.now(), //get today's date
                      firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                    if(pickedDate != null ){
                     // print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                     // print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                      setState(() {
                          enddateController.text = formattedDate; //set foratted date to TextField value. 
                        //startdateController.text = pickedDate.toString();
                      });
                  }else{
                      print("Date is not selected");
                  }
            }
        
      ),
    ),
  ],
),


            Switch(
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),

            // const SizedBox(height: 24),
            // TextFormField(
            //   controller: _controllerC,
            //   decoration: InputDecoration(
            //       prefixIcon: Icon(Icons.search),
            //       suffixIcon: IconButton(
            //         onPressed: _controllerC.clear,
            //         icon: Icon(Icons.clear),
            //       ),
            //       labelText: "Κατηγορίες",
            //       hintText: 'Προσθήκη'),
            //   onChanged: (categories) {},
            // ),
 

TextFormField(
  controller: _controller,
  decoration: InputDecoration(
    suffixIcon: PopupMenuButton<String>(
      icon: const Icon(Icons.arrow_drop_down),
      onSelected: (String value) {
        _controller.text = value;
      },
      itemBuilder: (BuildContext context) {
        return items
            .map<PopupMenuItem<String>>((String value) {
          return new PopupMenuItem(
              child: new Text(value), value: value);
        }).toList();
      },
    ),
    labelText: "Κατηγορίες",
    hintText: 'Προσθήκη'
  ),
  
),


            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Στοιχεία επικοινωνίας",
              ),
              onChanged: (communication) {},
            ),

            Spacer(),
            TextButton(
            style: TextButton.styleFrom(),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                      'You have submitted a new event'),
                ),
              );
            },
            child: Text('Submit'),
            )
          ],
        ),
      );
}
