import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_num/settins.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> randNum = [123, 456, 789];
  int maxNum = 10000;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF2D2D33),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Random',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (context) =>
                                    Settings(curValue: maxNum)),
                          );
                          // Settings(curValue: maxNum);
                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 40,
                        ))
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: randNum
                        .map((x) => Row(
                            children: x
                                .toString()
                                .split('')
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        'asset/img/$e.png',
                                        height: 80,
                                      ),
                                    ))
                                .toList()))
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        final num = Random();
                        for (var i = 0; i < 3; i++) {
                          randNum[i] = num.nextInt(maxNum);
                        }
                        print(randNum);
                        setState(() {});
                      },
                      child: const Text(
                        'Generate a number!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
