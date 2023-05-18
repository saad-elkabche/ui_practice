import 'package:flutter/material.dart';

import 'secreens/home.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'myApp',
      home: Home(),
      theme: ThemeData(
        accentColor: Colors.black,

        textSelectionTheme:const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionHandleColor: Colors.black,

        )
      ),
    );
  }
}
