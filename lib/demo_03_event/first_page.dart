import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var toggle = false;

  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer.onTap = () {
      setState(() {
        toggle = !toggle;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.grey,
            ),
            children: [
              TextSpan(
                text: 'welcome',
                style: TextStyle(
                  fontSize: 30,
                  color: toggle ? Colors.red : Colors.green,
                ),
              ),
              const TextSpan(text: '  '),
              TextSpan(text: 'Ivan', recognizer: _tapGestureRecognizer),
            ],
          ),
        ),
      ),
    );
  }
}
