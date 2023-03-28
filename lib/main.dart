import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_num/settins.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> randNum = [123, 456, 789];
  int maxNum = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D33),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TopPart(onPressed: onPressed),
              MiddlePart(randNum: randNum),
              BottomPart(onGenPressed: onGenPressed),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() async {
    print('preTarget: $maxNum');
    final setValue = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Settings(curValue: maxNum)),
    );
    maxNum = setValue;
    print('postTarget: $maxNum');
  }

  onGenPressed() {
    final num = Random();
    final Set<int> numberSet = {};

// 중복된 숫자가 발생할 경우를 위해...
    while (numberSet.length != 3) {
      numberSet.add(num.nextInt(maxNum));
    }

    setState(() {
      randNum = numberSet.toList();
    });
  }
}

///-- void Function()? onGenPressed;
class BottomPart extends StatelessWidget {
  VoidCallback onGenPressed;
  BottomPart({required this.onGenPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onGenPressed,
          child: const Text(
            'Generate a number!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }
}

class MiddlePart extends StatelessWidget {
  const MiddlePart({
    super.key,
    required this.randNum,
  });

  final List<int> randNum;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randNum
            .asMap()
            .entries
            .map((x) => Row(
                children: x.value
                    .toString()
                    .split('')
                    .map((e) => Padding(
                          padding: EdgeInsets.only(
                              bottom: x.key == 2 ? 0 : 8, right: 8),
                          child: Image.asset(
                            'asset/img/$e.png',
                            height: 80,
                          ),
                        ))
                    .toList()))
            .toList(),
      ),
    );
  }
}

class TopPart extends StatefulWidget {
  void Function()? onPressed;
  TopPart({required this.onPressed, super.key});

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
              fontSize: 50, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        IconButton(
            onPressed: widget.onPressed,
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 40,
            ))
      ],
    );
  }
}
