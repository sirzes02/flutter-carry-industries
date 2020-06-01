import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Spregunta.dart';

class Ppregunta extends StatefulWidget {
  @override
  final preguntaUse, pregunta1;

  Ppregunta({Key key, @required this.preguntaUse, this.pregunta1})
      : super(key: key);
  _PpreguntaoState createState() => _PpreguntaoState(preguntaUse, pregunta1);
}

class _PpreguntaoState extends State<Ppregunta> {
  @override
  final preguntaUse, pregunta1;
  _PpreguntaoState(this.preguntaUse, this.pregunta1);
  String use = "Selecione una marca";

  /// MARCAS
  Future<List> marcas() async {
    final reponde =
        await http.post("http://3.16.167.111/Carry-industries/marcas.php");

    var dataMar = json.decode(reponde.body);

    if (dataMar.length > 0) {
      return dataMar;
    } else {
      Toast.show("error", context,
          duration: 1,
          gravity: Toast.CENTER,
          backgroundColor: Color.fromRGBO(132, 13, 153, .9),
          textColor: Color.fromRGBO(225, 225, 225, .9));
    }
  }

  List<String> marcas1 = ["Selecione una marca"];
  @override
  void initState() {
    super.initState();
    marcas().then((value) {
      setState(() {
        value.forEach((val) {
          marcas1.add(val);
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
            "Marca",
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
                    child: Image.asset("imagenes/w.png"),
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
                      child: Text('¿Qué marca de carro desea usted?',
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
                            items: marcas1.map((String e) {
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
                    margin: EdgeInsets.only(top: (heightApp * 0.22)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Spregunta(
                                    preguntaUse: preguntaUse,
                                    pregunta1: use,
                                  )),
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
