import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, // 바깥 배경은 흰색
        body: Center(
          child: FittedBox( // 화면 크기에 맞게 줄이거나 키움
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const CalculatorBody(),
            ),
          ),
        ),
      ),
    );
  }
}

class CalculatorBody extends StatelessWidget {
  const CalculatorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.white),
            Text('표준', style: TextStyle(color: Colors.white, fontSize: 18)),
            Icon(Icons.access_time, color: Colors.white),
          ],
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            '0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const CalculatorButtonGrid(),
      ],
    );
  }
}

class CalculatorButtonGrid extends StatelessWidget {
  const CalculatorButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      ['MC', 'MR', 'M+', 'M-', 'MS'],
      ['%', 'CE', 'C', 'x'],
      ['1/x', 'x²', '√x', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '−'],
      ['1', '2', '3', '+'],
      ['±', '0', '.', '='],
    ];

    return Column(
      children: buttons.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: row.map((text) {
            final isEqual = text == '=';
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 56),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: isEqual ? Colors.blue : Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: TextStyle(
                          color: isEqual ? Colors.white : Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
