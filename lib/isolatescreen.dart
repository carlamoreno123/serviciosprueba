import 'dart:isolate';
import 'package:flutter/material.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  int? _resultado;
  bool _calculando= false;
  int _contador = 0;
   Future<void> suma() async{
    setState(() {
      _calculando =true;
    });
    final receptor= ReceivePort();
    await Isolate.spawn(_tareaPesada, receptor.sendPort);
    receptor.listen((message){
      setState(() {
        _resultado =mensaje;
        _calculando =false;
      });
      receptor.close();
    });
   }
   static _tareaPesada(SendPort sendport){
    int sum = 0;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Isolates'),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pushNamed(context, 'stream');
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              _calculando 
              ? CircularProgressIndicator()
              :Text(
                _resultado ==null 
                ? 'presiona el boton pa iniciar la cuenta'
                : '$_resultado'
              ),SizedBox(
                height: 30,
              ),ElevatedButton(onPressed: _calculando ?null: suma,
             
                  child: const Text('Iniciar operación'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Sumar 1'),
                  onPressed: () {
                    setState(() {
                      _contador++;
                    });
                  },
                ),
                Text('$_contador', style: const TextStyle(fontSize: 30))
              ],
            ),
          ),
        ));
  }
}