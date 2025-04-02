import 'package:flutter/material.dart';
import 'package:flutter_rust_app/src/rust/api/simple.dart';
import 'package:flutter_rust_app/src/rust/frb_generated.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Rust library
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rust Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Rust Linux Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Use AppState to match Rust's structure
  late AppState _appState;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initRust();
  }

  Future<void> _initRust() async {
    try {
      // Get the initial state from Rust
      final initialState = await getInitialState();
      setState(() {
        _appState = initialState;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _appState = AppState(counter: 0, message: "Error connecting to Rust: $e");
        _isLoading = false;
      });
    }
  }

  void _incrementCounter() async {
    final result = await incrementCounter(state: _appState);
    setState(() {
      _appState = result;
    });
  }

  void _decrementCounter() async {
    final result = await decrementCounter(state: _appState);
    setState(() {
      _appState = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${_appState.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _appState.message,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _isLoading ? null : _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _isLoading ? null : _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
