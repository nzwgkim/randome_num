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
  List<int> randomNums = [123, 456, 789];
  int maxNum = 1000;
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
                TopPart(maxNum: maxNum),
                MiddlePart(randomNums: randomNums),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      final num = Random();
                      print('Bottom: $maxNum');
                      final List<int> ran = [];
                      for (var i = 0; i < 3; i++) {
                        ran.add(num.nextInt(maxNum));
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

class MiddlePart extends StatelessWidget {
  const MiddlePart({
    super.key,
    required this.randomNums,
  });

  final List<int> randomNums;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNums
            .asMap()
            .entries
            .map(
              (x) => Padding(
                padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 12),
                child: Row(
                  children: x.value
                      .toString()
                      .split('')
                      .map(
                        (i) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
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
    );
  }
}

class TopPart extends StatefulWidget {
  int maxNum = 1000;
  TopPart({
    required this.maxNum,
    super.key,
  });

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Random',
          style: TextStyle(
              fontSize: 60, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        IconButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Settings(),
            ));
            setState(() {
              widget.maxNum = result;
            });
            print('Top: $result');
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.red,
            size: 40,
          ),
        ),
      ],
    );
  }
}
