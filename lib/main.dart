import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return IMCForm(widget: widget);
  }
}

class IMCForm extends StatelessWidget {
  const IMCForm({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            Text(
              'Digite seu peso',
              style: Theme.of(context).textTheme.headline4,
            ),
            // ignore: prefer_const_constructors
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                hintText: 'Ex: 80',
              ),
              keyboardType: TextInputType.number,
            ),
            Text(
              'Digite sua altura',
              style: Theme.of(context).textTheme.headline4,
            ),
            // ignore: prefer_const_constructors
            TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
                hintText: 'Ex: 180',
              ),
              keyboardType: TextInputType.number,
            ),
            // ignore: deprecated_member_use, prefer_const_constructors
            RaisedButton(
            onPressed: () {  },
            // ignore: prefer_const_constructors
            child: Text("Calcular"),
            ),
          ],
        ),
      )
    );
  }
}


