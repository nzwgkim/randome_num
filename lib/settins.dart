import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  late int curValue;
  Settings({required this.curValue, super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // var curValue = 10000.0;
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
              _BodyPart(widget: widget),
              Slider(
                value: widget.curValue.toDouble(),
                min: 10000,
                max: 1000000,
                onChanged: (value) {
                  setState(() {
                    widget.curValue = value.toInt();
                  });
                  // print('Slider: $value');
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
                      final setValue = widget.curValue.toInt();
                      // print('setting: $setValue');
                      Navigator.of(context).pop(setValue);
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

class _BodyPart extends StatelessWidget {
  const _BodyPart({
    required this.widget,
  });

  /// take a widget as a parameter
  final Settings widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: widget.curValue
            .toInt()
            .toString()
            .split('')
            .map(
              (x) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  'asset/img/$x.png',
                  height: 70,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
