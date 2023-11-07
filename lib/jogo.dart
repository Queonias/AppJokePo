import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = const AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolha = opcoes[numero];

    switch (escolha) {
      case "pedra":
        setState(() {
          _imagemApp = const AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = const AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = const AssetImage("imagens/tesoura.png");
        });
        break;
    }

    // Validação do ganhador
    if ((escolhaUsuario == "pedra" && escolha == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolha == "papel") ||
        (escolhaUsuario == "papel" && escolha == "pedra")) {
      setState(() {
        _mensagem = "Parabéns!! você ganhou : /";
      });
    } else if ((escolha == "pedra" && escolhaUsuario == "tesoura") ||
        (escolha == "tesoura" && escolhaUsuario == "papel") ||
        (escolha == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _mensagem = "você perdeu ; )";
      });
    } else {
      setState(() {
        _mensagem = "Empatamos :-0";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokePo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: const Image(
                    image: AssetImage("imagens/pedra.png"), height: 95),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: const Image(
                    image: AssetImage("imagens/papel.png"), height: 95),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: const Image(
                    image: AssetImage("imagens/tesoura.png"), height: 95),
              ),
            ],
          )
        ],
      ),
    );
  }
}
