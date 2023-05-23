import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '/' ||
        buttonText == 'x') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      _output = _output + buttonText;
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toString();
    });
  }

  buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora',
        ),
      ),
      body: Column(
        children: [
          Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('x'),
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+'),
                ],
              ),
              Row(
                children: [
                  buildButton('CLEAR'),
                  buildButton('='),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
