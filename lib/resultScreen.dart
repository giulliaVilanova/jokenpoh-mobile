import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String userChoice;
  final String appChoice;
  final String result;

  ResultScreen({
    required this.userChoice,
    required this.appChoice,
    required this.result,
  });

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
      body: Center( // Centraliza todo o conteúdo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alinha verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Alinha horizontalmente
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/$appChoice.png'),
              ),
              SizedBox(height: 10),
              Text(
                'Escolha do APP:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              Text(
                'Sua Escolha:',
                style: TextStyle(fontSize: 18),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/$userChoice.png'),
              ),
              SizedBox(height: 30),
              Text(
                result,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              if (result == 'Você Venceu!')
                Image.asset('assets/vitoria.png', width: 48, height: 48)
              else if (result == 'Você Perdeu!')
                Image.asset('assets/perder.png', width: 48, height: 48)
              else if (result == 'Empate!')
                  Image.asset('assets/empate.png'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Jogar Novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}