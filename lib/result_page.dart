import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator/main.dart';


class ResultPage extends StatelessWidget {
  final String wgt;
  final String hgt;
  const ResultPage(this.wgt, this.hgt);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: resultPage(this.wgt, this.hgt),
    );
  }
}

class resultPage extends StatefulWidget {
  final String wgt;
  final String hgt;

  const resultPage(this.wgt, this.hgt);

  @override
  _resultPageState createState() => _resultPageState(this.wgt, this.hgt);
}

class _resultPageState extends State<resultPage>  {
   late String wgt;
   late String hgt;
  _resultPageState(this.wgt, this.hgt);

  String _calculate() {

      double weight = double.parse(wgt);
      double height = double.parse(hgt) / 100;
      double imc = weight / (height * height);
      String result = "";

      if (imc < 18.6) {
        result = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        result = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        result = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        result = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        result = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc > 40) {
        result = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMCResultado"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_constructors
            children: <Widget>[
                Text(_calculate(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    ),
                RaisedButton(
                    child: Text("Calcular Novamente",
                    style: TextStyle(
                    color: Colors.white, fontSize: 25.0)),
                    color: Colors.black,
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