import 'package:flutter/material.dart';
import 'package:flutter_1/navigator/Inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
    key: _formKey,
    child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: Colors.black),
              ),
              height: 650,
              width: 375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Insira o nome da tarefa';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Nome',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty ||
                            int.parse(value) < 1 ||
                            int.parse(value) > 5) {
                          return 'Insira uma dificuldade de 1 a 5';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Dificuldade',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.grade),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Insira um URL de imagem';
                        }
                        return null;
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Imagem',
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.image),
                      ),
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(imageController.text, errorBuilder:
                            (BuildContext, Object exception,
                                StackTrace? StackTrace) {
                          return const Icon(Icons.error_outline);
                        }, fit: BoxFit.cover),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text,
                              imageController.text,
                              int.parse(difficultyController.text)
                          );
                          ScaffoldMessenger.maybeOf(context)!.showSnackBar(const SnackBar(
                            content: Text('Tarefa sendo concluída'),
                          ));
                          Navigator.pop(widget.taskContext);
                        }
                      },
                      child: const Text('Adicionar')
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
