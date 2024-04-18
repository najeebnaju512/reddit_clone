import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, size: 35, color: Colors.black),
          onPressed: () {},
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
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: TextField(
                  maxLength: 150,
                  decoration: InputDecoration(
                    hintText: "Max Length 150",
                    border: InputBorder.none
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), //for spacing between texts
            Text(
              'Body text (optional)',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10,),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Max Length 150",
                    border: InputBorder.none
                  ),
                ),
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.link),
                    Icon(Icons.image),
                    Icon(Icons.video_collection),
                    Icon(Icons.file_copy),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
