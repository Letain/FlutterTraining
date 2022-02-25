import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Test'),
            content: const Text('Body'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ]
          );
        });
        print('My Button was tapped');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}