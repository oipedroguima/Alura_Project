import 'Difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String nome;
  final String image;
  final int dificuldade;
  const Task(this.nome, this.image,this.dificuldade,{super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4.0)
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.grey,
                        width: 99,
                        child: Image.network(widget.image),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox (
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Difficulty(difficultyLevel: widget.dificuldade,)
                        ],
                      ),
                      SizedBox(
                        width: 52,
                        height: 52,
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState((){
                                  nivel++;
                                });
                                print(nivel);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Icon(Icons.arrow_drop_up),
                                  Text('UP', style: TextStyle(fontSize: 12),),
                                ],
                              ),

                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:
                      SizedBox(
                        width: 200,
                        child:
                        LinearProgressIndicator(
                          value: (widget.dificuldade > 0) ?
                          (nivel/widget.dificuldade)/20 : 1,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nivel: $nivel',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
    );
  }
}