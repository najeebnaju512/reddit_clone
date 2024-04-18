import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global_widgets/image_icon.dart';
import '../../bottom_navigation_screen/controller/bottom_nav_con';

class CreateScreen extends StatefulWidget {
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  File? image;
  TextEditingController nameControl = TextEditingController();
  TextEditingController mobileControl = TextEditingController();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, size: 35, color: Colors.black),
          onPressed: () {
            Provider.of<BottomNavigationController>(context, listen: false)
                .currentIndex = 0;
          },
        ),
        actions: [
          Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextField(
                  maxLength: 150,
                  decoration: InputDecoration(
                      hintText: "Max Length 150", border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10), //for spacing between texts
            Text(
              'Description',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
             Text(
              'Add Image',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageIconButton(
                  width: size.width * .35,
                  height: size.height * .06,
                  onPressed: () => _getImage(ImageSource.camera),
                  icon: Icons.camera_alt_outlined,
                  label: 'Camera',
                ),
                ImageIconButton(
                  width: size.width * .35,
                  height: size.height * .06,
                  onPressed: () => _getImage(ImageSource.gallery),
                  icon: Icons.photo,
                  label: 'Gallery',
                ),
              ],
            ),
            if (image != null)
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 200,
                width: 200,
                child: Image.file(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
