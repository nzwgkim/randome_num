import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var curValue = 10000.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D33),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: curValue
                      .toInt()
                      .toString()
                      .split('')
                      .map(
                        (x) => Image.asset(
                          'asset/img/$x.png',
                          height: 80,
                        ),
                      )
                      .toList(),
                ),
              ),
              Slider(
                value: curValue,
                min: 10000,
                max: 1000000,
                onChanged: (value) {
                  setState(() {
                    curValue = value;
                  });
                  print('Slider: $value');
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.green),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(curValue.toInt());
                    },
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
