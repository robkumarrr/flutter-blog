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
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("First Flutter App")),
      body: const TextInputWidget()
      );
  }
}

// Takes constructor arguments and the override for the state
class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

// Handles state and rendering
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String textVar = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Hello World!") {
      controller.clear();
      text = "ooga booga";
    }

    setState(() {
      textVar = text;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.message), labelText: "Type a message: "),
        onChanged: (textVar) => changeText(textVar)
      ),
      Text(textVar)
    ]);
  }
}