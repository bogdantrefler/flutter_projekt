
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Практична робота №5
// Варіант №25

// Параметри оформлення
const double pixelSize = 25.0;
const Color pixelColor = Colors.red;
const Color borderColor = Colors.black;
const double borderWidth = 4.0;
const double cornerRadius = 5.0;

// Матриця цифри 4
// 1 - заповнений піксель
// 0 - порожня клітинка
const List<List<int>> digitFour = [
  [1, 0, 0, 0, 1],
  [1, 0, 0, 0, 1],
  [1, 0, 0, 0, 1],
  [1, 1, 1, 1, 1],
  [0, 0, 0, 0, 1],
  [0, 0, 0, 0, 1],
  [0, 0, 0, 0, 1],
];

// Головний клас програми
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Практична робота №5',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

// Головний екран
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade100,
        title: const Text('Практична робота №5'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: digitFour.map((row) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: row.map((cell) {
                          return PixelDot(
                            filled: cell == 1,
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Власний віджет PixelDot
class PixelDot extends StatelessWidget {
  final bool filled;

  const PixelDot({
    super.key,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    // Якщо клітинка порожня
    if (!filled) {
      return const SizedBox(
        width: pixelSize,
        height: pixelSize,
      );
    }

    // Якщо клітинка заповнена
    return Container(
      width: pixelSize,
      height: pixelSize,
      decoration: BoxDecoration(
        color: pixelColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(
          cornerRadius,
        ),
      ),
    );
  }
}
