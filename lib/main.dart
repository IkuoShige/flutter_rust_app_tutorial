import 'package:flutter/material.dart';
import 'package:my_app/src/rust/api/simple.dart';
import 'package:my_app/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() async {
    final result = await incrementCounter(value: _counter);
    setState(() {
      _counter = result;
    });
  }

  void _decrementCounter() async {
    final result = await decrementCounter(value: _counter);
    setState(() {
      _counter = result;
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF5F5F7),
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.lightBlue,
      title: const Text('Rustカウンター', 
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF333333)),
      ),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // カウンター表示を魅力的に
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'カウンター値',
                  style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
                ),
                const SizedBox(height: 8),
                Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 56, 
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // モダンなボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(
                icon: Icons.remove,
                onPressed: _decrementCounter,
                color: const Color(0xFFFF5252),
              ),
              const SizedBox(width: 24),
              _buildActionButton(
                icon: Icons.add,
                onPressed: _incrementCounter,
                color: const Color(0xFF4CAF50),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildActionButton({
  required IconData icon,
  required VoidCallback onPressed,
  required Color color,
}) {
  return Material(
    borderRadius: BorderRadius.circular(15),
    elevation: 4,
    color: color,
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    ),
  );
}
}