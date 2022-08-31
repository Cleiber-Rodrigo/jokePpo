//Importando dados
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagemApp = "Escolha uma opção abaixo:";

//O método abaixo recebe a opção escolhida pelo jogador e tbm gera uma opção aleatória para o App
  void _opcaoSelecionada (String escolhaJogador){
    var opcoes = ["pedra" , "papel", "tesoura"];
    var nAleatorio = Random().nextInt(3);
    var escolhaApp = opcoes[nAleatorio];

    //Exibição da imagem gerada pelo App
    switch (escolhaApp) {
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;

    }
    if(
        (escolhaJogador == "pedra" && escolhaApp == "tesoura") ||
        (escolhaJogador == "papel" && escolhaApp == "pedra") ||
        (escolhaJogador == "tesoura" && escolhaApp == "papel")
    ){
      _mensagemApp = "Paarabéns!!! Você ganhou! :)";
    }else if(
        (escolhaApp == "pedra" && escolhaJogador == "tesoura") ||
        (escolhaApp == "papel" && escolhaJogador == "pedra") ||
        (escolhaApp == "tesoura" && escolhaJogador == "papel")
    ){
      _mensagemApp = "Você perdeu :(";
    }else{
      _mensagemApp = "Empatamos :|";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Esqueleto do App
      appBar: AppBar( //Barra superior
        backgroundColor: Colors.blue,
        title: Text(
          "JokenPo",
        ),
      ),
      body: Center( //Centralizando
        child: Container(
          child: Column( //Colocar Widgets um debaixo do outro
            children: [
              Padding( //Distanciamento interno do container e temos tbm o margin que é o externo
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Escolha do App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                ),
              Image(image: this._imagemApp, height: 100), //Inserindo imagem
              Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  this._mensagemApp,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                ),
              ),
              ),
              Row( //Widgets um ao lado do outro
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector( //usamos GestureDetector para capturar dados ao usuário clicar na imagem por exemplo
                    onTap: () => this._opcaoSelecionada("pedra"), //onTap é ao dar um clique rápido. Temos que usar () => que é uma função anônima, pois não posso passar um método direto no onTap
                    child: Image.asset("imagens/pedra.png", height: 100),
                  ),
                  GestureDetector(
                    onTap: () => this._opcaoSelecionada("papel"),
                    child: Image.asset("imagens/papel.png", height: 100),
                  ),
                  GestureDetector(
                    onTap: () => this._opcaoSelecionada("tesoura"),
                    child: Image.asset("imagens/tesoura.png", height: 100),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
