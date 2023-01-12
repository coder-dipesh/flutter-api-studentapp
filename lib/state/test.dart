import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: generateNumbers,
      builder: (
        BuildContext context,
        AsyncSnapshot<int> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return Text(snapshot.data.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 40));
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}

Stream<int> generateNumbers = (() async* {
  await Future<void>.delayed(const Duration(seconds: 2));

  for (int i = 1; i <= 10; i++) {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield i;
  }
})();

Future<String> getData() {
  return Future.delayed(const Duration(seconds: 2), () {
    return "Hello i'am coming from Future function";
  });
}
