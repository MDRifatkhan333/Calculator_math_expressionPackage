import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  //varialbles
  double firstNumber = 0;
  double secondNumber = 0;
  var input = '';
  var outut = '';
  var operand = '';
  var inputSize = 40;
  var outputSize = 50;
  //butttonValueGet
  onButtonClick(values) {
    //print(values);
    if (values == 'AC') {
      input = '';
      outut = '';
    } else if (values == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (values == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = userInput.replaceAll("x", "*");
        Parser p = Parser();
        Expression exp = p.parse(userInput);
        ContextModel cm = ContextModel();
        var eval = exp.evaluate(EvaluationType.REAL, cm);
        outut = eval.toString();
        if (outut.endsWith('.0')) {
          outut = outut.substring(0, outut.length - 2);
        }

        inputSize = 20;
        outputSize = 50;
      }
    } else {
      input = input + values;
    }
    setState(() {
      // input = input;
      // outut = outut;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: inputSize.toDouble(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    outut,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.5),
                      fontSize: outputSize.toDouble(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              _buildButton(
                'AC',
                Colors.grey,
                Colors.black,
              ),
              _buildButton(
                '<',
                Colors.grey,
                Colors.black,
              ),
              _buildButton(
                '%',
                Colors.grey,
                Colors.black,
              ),
              _buildButton(
                '/',
                Colors.orange,
                Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              _buildButton(
                '7',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '8',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '9',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                'x',
                Colors.orange,
                Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              _buildButton(
                '4',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '5',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '6',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '-',
                Colors.orange,
                Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              _buildButton(
                '1',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '2',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '3',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '+',
                Colors.orange,
                Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              _buildButton(
                '00',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '0',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '.',
                Colors.grey,
                Colors.white,
              ),
              _buildButton(
                '=',
                Colors.orange,
                Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(25),
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
