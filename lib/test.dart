import 'package:flutter/material.dart';
import 'package:myapps/example.dart';
import 'package:myapps/tast2.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String data = '';
  late String data1;

  @override
  void initState() {
    setState(() {
      data = 'halow';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.place_outlined),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Test2()));
          }, icon: Icon(Icons.access_alarm_outlined)),
          InkWell(
            onTap: (){},
            child: Icon(Icons.access_alarm_outlined)),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Example()));
            },
            child: Icon(Icons.access_time_filled),
          )
        ],
        title: Text('ini test',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(data),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shadowColor: Colors.transparent,
            ),
            onPressed: (){
            setState(() {
              data = 'changed';
            });
          }, child: Text('change')),
        ],
      ),
    );
  }
}