import 'package:flutter/material.dart';
import 'package:myapps/tast2.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Test2()));
            },
            // ignore: prefer_const_constructors
            child: Icon(Icons.add_box_outlined),
          )
        ],
      ),
      
    );
  }
}