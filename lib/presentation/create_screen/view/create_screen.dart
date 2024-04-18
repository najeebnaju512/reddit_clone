import 'dart:io';

import 'package:clone_app/presentation/create_screen/controller/create_controller.dart';
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
  TextEditingController locControl = TextEditingController();
  TextEditingController captionControl = TextEditingController();

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Location',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  controller: locControl,
                  maxLength: 150,
                  decoration: InputDecoration(
                      hintText: "Max Length 150", border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10), //for spacing between texts
            Text(
              'Caption',
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
                  controller: captionControl,
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
            SizedBox(
              height: 15,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Provider.of<CreateController>(context, listen: false).onPost(
                      context,
                      selectedImage: image,
                      loc: locControl.text,
                      cap: captionControl.text);
                  locControl.clear();
                  captionControl.clear();
                  image = null;
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Post",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
