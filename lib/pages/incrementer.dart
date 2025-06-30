import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  //variable
  int _increment = 0;

  //function
  void _incrementCounter(){
    setState((){
      _increment++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff92A3FD),

        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.videogame_asset),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Incrementer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times:"),
            SizedBox(height: 5),
            Text(
              _increment.toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xff92A3FD),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _incrementCounter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff92A3FD),
                ),
                child: Text("INCREMENT", style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
      )
    );
  }
}
