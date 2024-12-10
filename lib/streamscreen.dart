
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  //for (int i = 0; i <= max; i++) {
  //await Future.delayed(const Duration(seconds: 1));
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Streams')),
      body: Center(
Future<void> getData() async {
  String data = await fetchData();
  print(data);
}
Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 3), () => "Datos recibidos");
}


        Stream<int> contadorStream(int max) async* {
	for (int i = 0; i <= max; i++) {
		await Future.delayed(Duration(seconds: 1));
		yield i;
	}
}
          // child:
          ),
    );
  }
}