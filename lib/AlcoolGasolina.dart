import 'dart:ffi';

import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  const AlcoolGasolina({super.key});

  @override
  State<AlcoolGasolina> createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _alcool = TextEditingController();
  TextEditingController _gasolina = TextEditingController();
  String? _resultado = "";

  void _calcular(){
      double? precoAlcool =  double.tryParse(_alcool.text);
      double? precoGasolina = double.tryParse(_gasolina.text);
      
      if(precoAlcool == null || precoGasolina == null){
        setState(() {
          _resultado = "Erro: Digite números maiores que 0, e utize ponto (.) e não vírgula." ;
        });
      }else{
        if((precoAlcool / precoGasolina) >= 0.7){
          setState(() {
            _resultado = "Melhor abastecer com gasolina." ;
          });
        }else{
          setState(() {
            _resultado = "Melhor abastecer com álcool." ;
          });
        }
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Álcool ou Gasolina")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Image.asset("assets/images/logo.png"),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(
                  fontSize:24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 0.0),
                child: Text(_resultado!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, backgroundColor: Colors.yellow),),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Preço Álcool, ex: 3.59"
              ),
              keyboardType: TextInputType.number,
              controller: _alcool,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Preço da Gasolina, ex: 5.59"
                ),
                keyboardType: TextInputType.number,
                controller: _gasolina,
              ),
            ),
            ElevatedButton(
              onPressed: _calcular,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Calcular",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
