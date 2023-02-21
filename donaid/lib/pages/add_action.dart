import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

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

    return ClipRRect(
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

class _AddActionPageState extends State<AddActionPage> {

  bool _switchValue = false;
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ActionWidget(
              imagePath:
                  "http://st.depositphotos.com/1146092/4811/i/450/depositphotos_48115167-very-funny-dog.jpg",
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
            const SizedBox(height: 24),
            TextFormField(
              enabled: _switchValue,
              decoration: InputDecoration(
                labelText: "Ημερομηνία",
              ),
              onChanged: (date) {},
            ),
            Switch(
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _controllerC,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: _controllerC.clear,
                    icon: Icon(Icons.clear),
                  ),
                  labelText: "Κατηγορίες",
                  hintText: 'Προσθήκη'),
              onChanged: (categories) {},
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Στοιχεία επικοινωνίας",
              ),
              onChanged: (communication) {},
            ),
          ],
        ),
      );
}
