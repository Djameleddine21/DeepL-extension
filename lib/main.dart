import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _getText()!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SizedBox(
        height: 600.0,
        width: 400.0,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: "Paste your text here"),
                autofocus: true,
                onSubmitted: (value) {
                  setState(() {
                    _text = value;
                    _showText = true;
                    _copyToClipboard();
                  });
                },
              ),
              const SizedBox(height: 16.0),
              _showText
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ElevatedButton(
                            child: const Text("Copy to clipboard"),
                            onPressed: _copyToClipboard,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        SelectableText(_getText()!),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
