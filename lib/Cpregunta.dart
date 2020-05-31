import 'dart:convert';

import 'package:appcarro/Qpregunta.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class Cpregunta extends StatefulWidget {
  @override
  final preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4;

  Cpregunta(
      {Key key,
      @required this.preguntaUse,
      this.pregunta1,
      this.pregunta2,
      this.pregunta3,
      this.pregunta4})
      : super(key: key);
  _CpreguntaoState createState() =>
      _CpreguntaoState(preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4);
}

class _CpreguntaoState extends State<Cpregunta> {
  @override
  final preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4;
  _CpreguntaoState(this.preguntaUse, this.pregunta1, this.pregunta2,
      this.pregunta3, this.pregunta4);
  String use = "Selecione el tipo";

  /// MARCAS
  Future<List> tipo() async {
    final reponde =
        await http.post("http://3.16.167.111/proyectoCaro/tipos.php");

    var dataTipo = json.decode(reponde.body);

    if (dataTipo.length > 0) {
      return dataTipo;
    } else {
      Toast.show("error", context,
          duration: 1,
          gravity: Toast.CENTER,
          backgroundColor: Color.fromRGBO(132, 13, 153, .9),
          textColor: Color.fromRGBO(225, 225, 225, .9));
    }
  }

  List<String> tipos1 = ["Selecione el tipo"];
  @override
  void initState() {
    super.initState();
    tipo().then((value) {
      setState(() {
        value.forEach((val) {
          tipos1.add(val);
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
            "Tipo",
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
                    width: widthApp * 0.4,
                    alignment: Alignment.center,
                    child: Image.asset("imagenes/por.png"),
                    height: 180,
                    margin: EdgeInsets.only(top: (heightApp * .05)),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    width: widthApp * 0.8,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: (heightApp * 0.07)),
                    child: Text('¿Qué tipo de carro desea usted?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFA37136))),
                  )),
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
                            style: new TextStyle(
                                color: Color(0xFF5C6917),
                                fontSize: 18,
                                fontFamily: "Montserrat"),
                            value: use,
                            items: tipos1.map((String e) {
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
                              builder: (context) => Qpregunta(
                                  preguntaUse: preguntaUse,
                                  pregunta1: pregunta1,
                                  pregunta2: pregunta2,
                                  pregunta3: pregunta3,
                                  pregunta4: use)),
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
