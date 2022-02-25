# flutter_training

A Flutter Learning Helper.
Based on [Flutter](https://flutterchina.club/get-started/codelab/) Official.

## Base Knowledge

#### Prepare Environment
* [Windows](https://flutterchina.club/setup-windows/)

#### Start An Application
```
void main() => runApp(MaterialAPP(title: 'Title', home: AnyWidget());
```

#### Widget
* StatelessWidget

```
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return AnyWidget();
  }
}
```
* StatefulWidget

```
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context){
    return AnyWidget();
  }
}
```

#### Components
* Text
* Row
* Column
* Stack
* Container
* ...
* AppBar
* Scaffold
* Center
* Expanded
* ...
* Customed



