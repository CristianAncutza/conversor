import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pagina home'),
      ),
      body: Center(
        child: Text('HomeScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('test');
        },
      ),
    );
  }
}
