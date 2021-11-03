import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeepL Extension',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'DeepL Extension'),
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
  String? _text;
  bool _showText = false;

  String? _getText() {
    return _text?.split('\n').toList().join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Paste your text here"),
              onSubmitted: (value) {
                setState(() {
                  _text = value;
                  _showText = true;
                });
              },
            ),
            const SizedBox(height: 20.0),
            _showText ? SelectableText(_getText()!) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
