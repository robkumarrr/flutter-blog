import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rob's App",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textVar = "";

  void changeText(String text) {
    setState(() {
      textVar = text;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: const Text("First Flutter App")),
        body: Column(children: <Widget>[
          TextInputWidget(changeText), 
          Text(textVar)
        ]));
    }
}

// Takes constructor arguments and the override for the state
class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  const TextInputWidget(this.callback, {super.key});
  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

// Handles state and rendering
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.message), 
          labelText: "Type a message: ",
          suffixIcon: IconButton(
            icon: const Icon(Icons.send), 
            splashColor: Colors.orangeAccent,
            tooltip: "Post message",
            onPressed: click,
          )));
  }
}