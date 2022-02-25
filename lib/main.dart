import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'BaseWidget.dart';
import 'Gesture.dart';
import 'MaterialWidget.dart';
import 'WordPair.dart';
import 'StatefulWidgetExample.dart';

// word pair
//void main() => runApp(MyApp());

// base widget
//void main() => runApp(new MaterialApp(title: 'MyApp', home: new MyScaffold()));

// material widget
//void main() => runApp(const MaterialApp(title: "Flutter Tutorial", home: TutorialHome()));

// Gesture
//void main() => runApp(const MaterialApp(title: "Flutter Tutorial", home: MyButton()));

// StatefulWidget
//void main() => runApp(const MaterialApp(title: 'StatefulWidgetExample', home: Counter()));
//void main() => runApp(const MaterialApp(title: 'StatefulWidgetExample', home: Counter1()));
void main(){
  runApp(MaterialApp(
    title: 'Shopping APp',
    home: ShoppingList(
      products: [
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}


