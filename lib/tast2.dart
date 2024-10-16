import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
      ),
      body: Column(
        children: [
          Text('test'),
          Text('testttt'),
          Row(
            children: [
              Text('test '),
              Text('12323')
            ],
          ),
          Container(
            width:100,
            height: 100,
            
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8), 
            ),
          ),
        ],
      ),
    );
  }
}