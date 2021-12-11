import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator/main.dart';


class ResultPage extends StatelessWidget {
  final String wgt;
  final String hgt;
  final Color color;
  const ResultPage(this.wgt, this.hgt, this.color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: resultPage(this.wgt, this.hgt, this.color),
    );
  }
}

class resultPage extends StatefulWidget {
  final String wgt;
  final String hgt;
  final Color color;
  const resultPage(this.wgt, this.hgt, this.color);

  @override
  _resultPageState createState() => _resultPageState(this.wgt, this.hgt, this.color);
}

class _resultPageState extends State<resultPage>  {
   late String wgt;
   late String hgt;
   late Color color;
  _resultPageState(this.wgt, this.hgt, this.color);

  String _calculate() {

      double weight = double.parse(wgt);
      double height = double.parse(hgt) / 100;
      double imc = weight / (height * height);
      String result = "";
      color = Colors.blue;

      if (imc < 18.6) {
        result = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
        color = Colors.red;
      } else if (imc >= 18.6 && imc < 24.9) {
        result = "Peso Ideal (${imc.toStringAsPrecision(3)})";
        color = Colors.green;
      } else if (imc >= 24.9 && imc < 29.9) {
        result = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
        color = Colors.orange;
      } else if (imc >= 29.9 && imc < 34.9) {
        result = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
        color = Colors.red;
      } else if (imc >= 34.9 && imc < 39.9) {
        result = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
        color = Colors.red;
      } else if (imc > 40) {
        result = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
        color = Colors.red;
      }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( _calculate()),
        centerTitle: true,
        backgroundColor: color,
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_constructors
            children: <Widget>[
                Text("Caso esta tela for vermelha, procure um médico",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: color, fontSize: 25.0),
                    ),
                RaisedButton(
                    child: Text("Calcular Novamente",
                    style: TextStyle(
                    color: Colors.white, fontSize: 25.0)),
                    color: color,
                    onPressed: () {
                     Get.to(() => Home());
                    },
                  ),
                ]
              ), 
            )
          );
  }
}