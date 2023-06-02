import 'package:flutter/material.dart';

void main() {
  runApp(const PeopleCounter());
}

class PeopleCounter extends StatelessWidget {
  const PeopleCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeopleCounter',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 0;
  String message = 'Welcome!';

  void increment() {
    setState(() {
      value++;
    });
  }

  void decrement() {
    setState(() {
      value--;
    });
  }

  bool get isEmpty => value <= 0;

  bool get isFull => value >= 10;

  TextButton textButton(String text, VoidCallback function, bool valid) {

    return TextButton(
      onPressed: valid ? null : function,
      style: TextButton.styleFrom(
        backgroundColor: valid ? Colors.white.withOpacity(0.2) : Colors.white,
        foregroundColor: Colors.black87,
        fixedSize: const Size(100, 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 100,
          height: 1,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'People Counter',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 10,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isFull ? Colors.red : Colors.green,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 100,
              width: 350,
              alignment: Alignment.center,
              child: Text(
                isFull ? 'Please Wait!!!' : 'Welcome!!!',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: 125,
              height: 125,
              alignment: Alignment.center,
              child: Text(
                '$value',
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textButton("+", increment, isFull),
                const SizedBox(
                  width: 50,
                ),
                textButton("-", decrement, isEmpty),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
