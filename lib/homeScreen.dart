import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jokenpoh/resultScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> options = ['pedra', 'papel', 'tesoura'];

  void playGame(String userChoice) {
    String appChoice = options[Random().nextInt(3)];
    String result = checkWinner(userChoice, appChoice);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          userChoice: userChoice,
          appChoice: appChoice,
          result: result,
        ),
      ),
    );
  }

  String checkWinner(String user, String app) {
    if (user == app) return 'Empate!';
    if ((user == 'pedra' && app == 'tesoura') ||
        (user == 'papel' && app == 'pedra') ||
        (user == 'tesoura' && app == 'papel')) {
      return 'Você Venceu!';
    }
    return 'Você Perdeu!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double centeredAvatarTop = (screenHeight - 100) / 2;
          double currentAvatarTop = 30;
          double newAvatarTop = currentAvatarTop + (centeredAvatarTop - currentAvatarTop) / 4 + 10;

          return Stack(
            children: [
              Positioned(
                top: newAvatarTop,
                left: (constraints.maxWidth - 100) / 2,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/padrao.png'),
                ),
              ),
              Positioned(
                top: newAvatarTop + 100 + 10,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'Escolha do APP (Aleatório)',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Escolha do Usuário:',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: options.map((choice) {
                        return GestureDetector(
                          onTap: () => playGame(choice),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/$choice.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}