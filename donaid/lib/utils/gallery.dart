// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyGallery extends StatefulWidget {
//   @override
//   _MyGalleryState createState() => _MyGalleryState();
// }
// class _MyGalleryState extends State<MyGallery> {
//   /// Variables
//   late File imageFile; ////////////

//   /// Widget
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image Picker"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton(
//                     //color: Colors.greenAccent,
//                     onPressed: () {
//                      _getFromGallery();
//                     },
//                     child: Text("PICK FROM GALLERY"),
//                   ),
//                   Container(
//                     height: 40.0,
//                   ),
                 
                 
//                   // RaisedButton(
//                   //   color: Colors.lightGreenAccent,
//                   //   onPressed: () {
//                   //     _getFromCamera();
//                   //   },
//                   //   child: Text("PICK FROM CAMERA"),
//                   // )
//                 ],
//               ),
//             ): Container(
//               child: Image.file(
//                 imageFile,
//                 fit: BoxFit.cover,
//               ),
//             )));
//   }

//   /// Get from gallery
//   _getFromGallery() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }



  /// Get from Camera
  // _getFromCamera() async {
  //   PickedFile pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
//}



// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';



// // class MyGallery extends StatefulWidget{
// //   @override
// //   _MyGalleryState createState() => _MyGalleryState();
// // }

// // class _MyGalleryState extends State<MyGallery> { 

// //   ImagePicker picker = ImagePicker();
// //   XFile? image;

// //   @override
// //   Widget build(BuildContext context) { 
// //     return  Scaffold(
// //           appBar: AppBar(
// //             title: Text("Image Picker from Gallery"),
// //             backgroundColor: Colors.redAccent
// //           ),
// //           body: Container(
// //             padding: EdgeInsets.only(top:20, left:20, right:20),
// //             alignment: Alignment.topCenter,
// //             child: Column(
// //               children: [

// //                  ElevatedButton(
// //                   onPressed: () async {
// //                       image = await picker.pickImage(source: ImageSource.gallery); 
// //                       setState(() {
// //                         //update UI
// //                       });
// //                   }, 
// //                   child: Text("Pick Image")
// //                 ),
 
// //                 image == null?Container():
// //                 Image.file(File(image!.path))
                
// //             ],)
// //           )
// //        );
// //   }
// // }