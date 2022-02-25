import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter ++;
    });
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter --;
      });
    }
    else {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Alert'),
            content: const Text('The minimum number is 0.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          child: const Text('Increment'),
          onPressed: _increment,
        ),
        Expanded(
            child: Center(child:
            Text('Count: $_counter', style: const TextStyle(
                fontSize: 25
            ),))),
        ElevatedButton(
          child: const Text('Decrement'),
          onPressed: _decrement,
        )
      ],
    );
  }
}


// make widgets divided into components
class CounterDisplay extends StatelessWidget {
  CounterDisplay({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Count: $count',
          style: const TextStyle(fontSize: 25),
        )
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Increment'),
      onPressed: onPressed,
    );
  }
}

class CounterDecrementor extends StatelessWidget {
  CounterDecrementor({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Decrement'),
      onPressed: onPressed,
    );
  }
}

class NumberAlertDialog extends StatelessWidget {
  const NumberAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Alert'),
        content: const Text('The minimum number is 0.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]
    );
  }
}

class Counter1 extends StatefulWidget {
  const Counter1({Key? key}) : super(key: key);

  @override
  _CounterState1 createState() => _CounterState1();
}

class _CounterState1 extends State<Counter1> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter --;
      });
    }
    else {
      showDialog(context: context, builder: (BuildContext context) {
        return const NumberAlertDialog();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterIncrementor(onPressed: _increment),
        Expanded(child: CounterDisplay(count: _counter)),
        CounterDecrementor(onPressed: _decrement)
      ],
    );
  }
}

// product/cart example

class Product {
  Product({required this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({required Product product, required this.inCart, required this.onCartChanged})
  : product = product, super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context){
    if(!inCart) return null;

    return const TextStyle(color: Colors.black54, decoration: TextDecoration.lineThrough);
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChanged(product, !inCart);
      },
      leading: CircleAvatar(
        child: Text(product.name[0]),
        backgroundColor: _getColor(context),
      ),
      title: Text(product.name, style: _getTextStyle(context),),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key, required this.products}): super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();

}

class _ShoppingListState extends State<ShoppingList> {

  final Set<Product> _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}


