import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> randomNums = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF2D2D33),
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Random',
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: randomNums
                        .asMap()
                        .entries
                        .map(
                          (x) => Padding(
                            padding:
                                EdgeInsets.only(bottom: x.key == 2 ? 0 : 12),
                            child: Row(
                              children: x.value
                                  .toString()
                                  .split('')
                                  .map(
                                    (i) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Image.asset(
                                        'asset/img/$i.png',
                                        height: 70,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      final num = Random();
                      // print(num.nextInt(1000));
                      final List<int> ran = [];
                      for (var i = 0; i < 3; i++) {
                        ran.add(num.nextInt(1000));
                      }
                      setState(() {
                        randomNums = ran;
                        // print(randomNums);
                      });
                    },
                    child: const Text(
                      'Generating...  ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
