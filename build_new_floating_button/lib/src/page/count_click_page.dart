import 'package:build_new_floating_button/src/widget/fancy_button.dart';
import 'package:flutter/material.dart';

class CounterClickPage extends StatefulWidget {
  CounterClickPage({Key key}) : super(key: key);

  @override
  _CounterClickPageState createState() => _CounterClickPageState();
}

class _CounterClickPageState extends State<CounterClickPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      appBar: AppBar(
        title: const Text('Counter Clicks'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Number Click:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FancyButton(onPressed: _incrementCounter),
    );
  }
}
