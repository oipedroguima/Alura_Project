import 'package:flutter/material.dart';
import 'package:flutter_1/navigator/Inherited.dart';
import 'package:flutter_1/screen/Form_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.green,
        title: const Text('Organizador de Tarefas'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
