import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:donaid/utils/multiselection.dart';
import 'package:donaid/utils/data.dart';
import 'package:donaid/main.dart';
import 'package:donaid/utils/gallery.dart';

var selectloc = [0.0, 0.0];
var setaddress = "";
var defaultimg =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png";
var selected_image = defaultimg;


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

class ActionWidget extends StatefulWidget {
  String imagePath;
  bool isEdit;
  var onClicked;
  ActionWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  _ActionWidget createState() => _ActionWidget();
}

class _ActionWidget extends State<ActionWidget> {
  // const _ActionWidget({
  //   Key? key,
  //   required this.imagePath,
  //   this.isEdit = false,
  //   required this.onClicked,
  // }) : super(key: key);
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
            //child: buildEditIcon(color),

            child: IconButton(
              onPressed: ()  {
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
                    } ).then((value){selected_image = _img;});

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
    if (_img == "") _img = defaultimg;
    final image = NetworkImage(_img);

    return ClipRect(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          // width: 128,
          height: 200,
          child: InkWell(onTap: widget.onClicked),
        ),
      ),
    );
  }

  @override
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
      ));

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
  // const AddActionPage({Key? key}) : super(key: key);

  @override
  _AddActionPageState createState() => _AddActionPageState();
}

var mapcontroller = TextEditingController();
var _titcontroller = TextEditingController();
var __descontroller = TextEditingController();
// var _catcontroller = TextEditingController();
// var _catcontrollerC = TextEditingController();

TextEditingController startdateController = TextEditingController();
TextEditingController enddateController = TextEditingController();
final TextEditingController _catcontroller = new TextEditingController();

class _AddActionPageState extends State<AddActionPage> {
  bool _switchValue = false;
  var items = ['Τρόφιμα', 'Φάρμακα', 'Άστεγοι', 'Αιμοδοσία', 'Ζώα/Αδέσποτα', 'Βιβλία', 'Ρούχα', 'Παιχνίδια', 'Περιβάλλον', 'Άλλο'];

// var items = <your call to api>;
  @override
  void initState() {
    selectloc = [0.0, 0.0];

    super.initState();
    startdateController.text = "";
    enddateController.text = "";
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ActionWidget(
              imagePath: defaultimg,
              isEdit: true,
              onClicked: () async {},
            ),

            const SizedBox(height: 24),
            TextFormField(
              controller: _titcontroller,
              decoration: InputDecoration(
                labelText: "Τίτλος",
              ),
              onChanged: (title) {},
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: __descontroller,
              decoration: InputDecoration(
                labelText: "Περιγραφή",
              ),
              onChanged: (description) {},
            ),

            const SizedBox(height: 24),
            TextFormField(
              controller: mapcontroller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyMap()),
                    );
                  },
                  icon: Icon(Icons.add_location_alt_outlined),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    mapcontroller.text = "";
                    debugPrint("${selectloc[0]}");
                    selectloc = [0.0, 0.0];
                    // mp.addmaploc = [0.0,0.0]
                  },
                  icon: Icon(Icons.clear),
                ),
                labelText: "Τοποθεσία",
                hintText: "Πάτα το pin αριστερά "
              ),
              onChanged: (location) {},
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(
                  width: 20.0,
                  height: 24,
                ),
                Flexible(
                  child: TextFormField(
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
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          // print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                          String formattedDate = DateFormat('dd-MM-yyyy').format(
                              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          // print(formattedDate); //formatted date output using intl package =>  2022-07-04
                          //You can format date as per your need

                          setState(() {
                            startdateController.text =
                                formattedDate; //set foratted date to TextField value.
                            //startdateController.text = pickedDate.toString();
                          });
                        } else {
                          print("Date is not selected");
                        }
                      }),
                ),
                const SizedBox(
                  width: 20.0,
                  height: 24,
                ),
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
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          // print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                          String formattedDate = DateFormat('dd-MM-yyyy').format(
                              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          // print(formattedDate); //formatted date output using intl package =>  2022-07-04
                          //You can format date as per your need

                          setState(() {
                            enddateController.text =
                                formattedDate; //set foratted date to TextField value.
                            //startdateController.text = pickedDate.toString();
                          });
                        } else {
                          print("Date is not selected");
                        }
                      }),
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

            TextFormField(
              controller: _catcontroller,
              decoration: InputDecoration(
                  suffixIcon: PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (String value) {
                      _catcontroller.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return items.map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem<String>(
                            child: new Text(value), value: value);
                      }).toList();
                    },
                  ),
                  labelText: "Κατηγορίες",
                  hintText: 'Προσθήκη'),
            ),

            // const SizedBox(height: 24),
            // TextFormField(
            //   decoration: InputDecoration(
            //     labelText: "Στοιχεία επικοινωνίας",
            //   ),
            //   onChanged: (communication) {},
            // ),

            Spacer(),
            TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {
                String title = _titcontroller.text;
                String description = __descontroller.text;
                String location = mapcontroller.text;
                String stdate = startdateController.text;
                String edate = enddateController.text;
                String category = _catcontroller.text;
                // double x = selectloc[0];
                // double y = selectloc[1];
                String imgpath = selected_image;
                String date =
                    (_switchValue == true) ? "${stdate} έως ${edate}" : "Πάντα";
                var errmessage = " \n";
                if (title == "" ||
                    location == "" ||
                    selectloc[0] == 0.0 && selectloc[1] == 0.0 ||
                    date == "" ||
                    category == "") {
                  if (title == "") {
                    errmessage += "Επιλέξτε  Τίτλο\n";
                  }
                  if (location == "") {
                    errmessage += "Επιλεξτε Διεύθυνση\n";
                  }
                  if (selectloc[0] == 0.0 && selectloc[1] == 0.0) {
                    errmessage += "Επιλεξτε Σημείο στο Χάρτη\n";
                  }
                  if (date == "") {
                    errmessage += "Λανθασμένη Ημερομηνία\n";
                  }
                  if (category == "") {
                    errmessage += "Επιλέξτε Κατηγορία\n";
                  }

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(errmessage),
                          ));
                } else {
                  errmessage = "Η δράση '$title' προστέθηκε με επιτυχία!";
                  _titcontroller.text = "";
                  __descontroller.text = "";
                  mapcontroller.text = "";
                  startdateController.text = "";
                  enddateController.text = "";
                  _catcontroller.text = "";

                  var newaction = DonaidAction(
                      title: title,
                      organization: myID,
                      date: date,
                      place: location,
                      x: selectloc[0],
                      y: selectloc[1],
                      imgpath: imgpath,
                      isFavorite: false,
                      hasDonated: false,
                      type: category,
                      description: description);
                  selectloc = [0.0, 0.0];
                  
                  global_action["D${global_action.length + 1}"] = newaction;
                  get_data().then(((value) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Text(errmessage),
                            )).then((value){
                              Navigator.pop(context);
                            });
                  }));
                }
              },
              child: Text('Δημιουργία'),
            )
          ],
        ),
      );
}
