import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_calculator/result_page.dart';



void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController wgtController = TextEditingController();
  TextEditingController hgtController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String helper = "Digite seu peso e altura!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMCalculadora"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      controller: wgtController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira o seu peso!";
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      controller: hgtController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira a sua altura!";
                        }
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Container(
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.to(ResultPage(wgtController.text, hgtController.text));
                                }
                              },
                              child: Text("Calcular",
                              style: TextStyle(
                              color: Colors.white, fontSize: 25.0)),
                              color: Colors.black,
                            ))),
                    Text(
                      helper,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                    )
                  ],
                )
              )
            )
          );
  }
}