import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  const MyFirstApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyFirstApp> {
  // bool _loading = false;
  int count = 50;

  @override
  void initState() {
    count = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.red);

    return MaterialApp(
        title: 'My first flutter App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('My first work by create component'),
            centerTitle: true,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {
                  setState(() {
                    count -= 1;
                  });
                },
                child: const Icon(Icons.remove, color: Colors.black),
              ),
              RichText(
                selectionColor: Colors.blue,
                text: TextSpan(
                  text: 'Hello ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: '$count',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(text: ' world!'),
                  ],
                ),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  setState(() {
                    count += 1;
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       _loading = !_loading;
          //       _updateProgress();
          //     });
          //   },
          //   child: const Icon(Icons.home),
          // ),
        )
        // home: const MyHomePage(title: 'My first flutter App'),
        );
  }

  // void _updateProgress() {
  //   const sec = Duration(seconds: 1);
  //   Timer.periodic(sec, (Timer timer) {
  //     setState(() {
  //       _progress += 0.1;
  //       if (_progress >= 1.0) {
  //         _loading = false;
  //         timer.cancel();
  //         _progress = 0.0;
  //       }
  //     });
  //   });
  // }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//     required this.title,
//   });

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       appBar: AppBar(
//         title: Text('widget.title width counter $_counter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             // Text(
//             //   'You have pushed the button this many times:',
//             //   style: Theme.of(context).textTheme.headline1,
//             // ),
//             Text(
//               'Some counter $_counter',
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black38),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
