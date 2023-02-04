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
      for (var i = 0; i < 3; i++) {
        randNum[i] = num.nextInt(maxNum);
      }
      print('max: $maxNum, random: $randNum');
      setState(() {});
    }

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
}

class BottomPart extends StatefulWidget {
  void Function()? onGenPressed;
  BottomPart({required this.onGenPressed, super.key});

  @override
  State<BottomPart> createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: widget.onGenPressed,
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
