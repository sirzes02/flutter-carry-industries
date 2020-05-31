import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Tpregunta.dart';

class Spregunta extends StatefulWidget {
  @override
  final preguntaUse, pregunta1, pregunta2;

  Spregunta(
      {Key key, @required this.preguntaUse, this.pregunta1, this.pregunta2})
      : super(key: key);
  _SpreguntaoState createState() =>
      _SpreguntaoState(preguntaUse, pregunta1, pregunta2);
}

class _SpreguntaoState extends State<Spregunta> {
  @override
  final preguntaUse, pregunta1, pregunta2;
  _SpreguntaoState(this.preguntaUse, this.pregunta1, this.pregunta2);
  String use = "Selecione un modelo";

  /// MARCAS
  Future<List> modelos() async {
    final reponde =
        await http.post("http://3.16.167.111/proyectoCaro/listaModelo.php");

    var dataMod = json.decode(reponde.body);

    if (dataMod.length > 0) {
      return dataMod;
    } else {
      Toast.show("error", context,
          duration: 1,
          gravity: Toast.CENTER,
          backgroundColor: Color.fromRGBO(132, 13, 153, .9),
          textColor: Color.fromRGBO(225, 225, 225, .9));
    }
  }

  List<String> modelos1 = ["Selecione un modelo"];
  @override
  void initState() {
    super.initState();
    modelos().then((value) {
      setState(() {
        value.forEach((val) {
          modelos1.add(val);
        });
      });
    });
  }

  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Modelo",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .9),
                fontFamily: "Montserrat",
                fontSize: 25,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Image.asset("imagenes/car.png"),
                    height: 180,
                    margin: EdgeInsets.only(top: (heightApp * .05)),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: (heightApp * 0.07)),
                      child: Text('¿Qué modelo de carro desea usted? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFA37136))),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: widthApp * 0.8,
                          margin: EdgeInsets.only(top: (heightApp * 0.09)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: use,
                            style: new TextStyle(
                                color: Color(0xFF5C6917),
                                fontSize: 18,
                                fontFamily: "Montserrat"),
                            items: modelos1.map((String e) {
                              return DropdownMenuItem<String>(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (mostrar) {
                              setState(() {
                                use = mostrar;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    height: 50.0,
                    margin: EdgeInsets.only(top: (heightApp * 0.23)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tpregunta(
                                  preguntaUse: preguntaUse,
                                  pregunta1: pregunta1,
                                  pregunta2: use)),
                        );
                      },
                      child: new Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF5C6917),
                        size: 20.0,
                      ),
                      shape: new CircleBorder(),
                      color: Color(0xFFC6AD52),
                    ),
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
