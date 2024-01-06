

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
      title: Text('Jargon Lens'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
   body:Center(
      child: Image(
        image: NetworkImage('https://cdn-icons-png.flaticon.com/128/3898/3898082.png'),
    
    
      
      ),
      ),
        ),
    ));
}
Text(
    'Sign in',
    style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'Times New Roman',
        fontWeight: FontWeight.w700,
        height: 0,
    ),
)
Container(
    width: 276,
    decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
            ),
        ),
    ),
)
Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://via.placeholder.com/20x20"),
            fit: BoxFit.fill,
        ),
    ),
)
SizedBox(
    width: 51,
    height: 13,
    child: Text(
        'username\n',
        style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.w400,
            height: 0,
        ),
    ),
)