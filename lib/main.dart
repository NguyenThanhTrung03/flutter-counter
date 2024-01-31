import 'dart:ffi';
import 'package:flutter/material.dart';
import 'MyObject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Object',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyObject myObject = MyObject(0);
  int? n;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(myObject.value.toString(), style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                try {
                  n = int.parse(value);
                } catch (e) {
                  n = 0;
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập giá trị n',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  myObject.increase();
                  setState(() {});
                },
                icon: const Icon(Icons.add),
                label: const Text('Tăng'),
              ),
              const SizedBox(width: 20),
              OutlinedButton.icon(
                onPressed: () {
                  myObject.decrease();
                  setState(() {});
                },
                icon: const Icon(Icons.remove),
                label: const Text('Giảm'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              debugPrint(n.toString());
              myObject.value = myObject.power(n!);
              setState(() {});
            },
            icon: const Text(''),
            label: const Text('Luỹ thừa'),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              myObject.value = 0;
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Reset'),
          ),
        ],
      )),
    );
  }
}
