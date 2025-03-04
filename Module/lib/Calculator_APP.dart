import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Widget/CalculatorButton.dart';

class calculatorAPP extends StatefulWidget {
  const calculatorAPP({super.key});

  @override
  State<calculatorAPP> createState() => _calculatorAPPState();
}

class _calculatorAPPState extends State<calculatorAPP> {

  String _output = '0';
  String _input = '';
  String operand = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String value){

    setState(() {
      if(value == 'C'){
        _output = '0';
        _input = '';
        operand = '';
        num1 = 0;
        num2 = 0;
      }
      else if(value == '='){
        num2 = double.parse(_input);
        if(operand == '+'){
          _output = (num1+num2).toString();
        }
        else if(operand == '-'){
          _output = (num1-num2).toString();
        }
        else if(operand == '*'){
          _output = (num1*num2).toString();
        }
        else if(operand == '/'){
          _output = (num2!=0) ? (num1/num2).toString() : 'Error';
        }
        _input = _output;
      }
      else if(['+','-','*','/'].contains(value)){
        num1= double.parse(_input);
        operand = value;
        _input = '';
      }
      else{
        _input += value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(_output, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
          Row(
            children: [
              CalculatorButton(text: '7', onClick: () => buttonPressed('7'),),
              CalculatorButton(text: '8', onClick: () => buttonPressed('8'),),
              CalculatorButton(text: '9', onClick: () => buttonPressed('9'),),
              CalculatorButton(text: '/', color: Colors.purple, onClick: () => buttonPressed('/'),),
            ],
          ),
          Row(
            children: [
              CalculatorButton(text: '4', onClick: () => buttonPressed('4'),),
              CalculatorButton(text: '5', onClick: () => buttonPressed('5'),),
              CalculatorButton(text: '6', onClick: () => buttonPressed('6'),),
              CalculatorButton(text: '*', color: Colors.purple, onClick: () => buttonPressed('*'),),
            ],
          ),
          Row(
            children: [
              CalculatorButton(text: '1', onClick: () => buttonPressed('1'),),
              CalculatorButton(text: '2', onClick: () => buttonPressed('2'),),
              CalculatorButton(text: '3', onClick: () => buttonPressed('3'),),
              CalculatorButton(text: '-', color: Colors.purple, onClick: () => buttonPressed('-'),),
            ],
          ),
          Row(
            children: [
              CalculatorButton(text: 'C', color: Colors.red, onClick: () => buttonPressed('C'),),
              CalculatorButton(text: '0', onClick: () => buttonPressed('0'),),
              CalculatorButton(text: '=', color: Colors.green, onClick: () => buttonPressed('='),),
              CalculatorButton(text: '+', color: Colors.purple, onClick: () => buttonPressed('+'),),
            ],
          ),

        ],
      ),
    );
  }
}


