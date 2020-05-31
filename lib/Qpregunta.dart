import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Listado.dart';

class Qpregunta extends StatefulWidget {
  @override
  final preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5;

  Qpregunta(
      {Key key,
      @required this.preguntaUse,
      this.pregunta1,
      this.pregunta2,
      this.pregunta3,
      this.pregunta4,
      this.pregunta5})
      : super(key: key);
  _QpreguntaoState createState() => _QpreguntaoState(
      preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5);
}

class _QpreguntaoState extends State<Qpregunta> {
  final preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5;
  _QpreguntaoState(this.preguntaUse, this.pregunta1, this.pregunta2,
      this.pregunta3, this.pregunta4, this.pregunta5);
  TextEditingController controllerPla = new TextEditingController();

  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Placa",
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
                  child: AnimatedContainer(
                    duration: Duration(seconds: 5),
                    width: widthApp * 0.8,
                    alignment: Alignment.center,
                    child: Image.asset("imagenes/ww.png"),
                    height: 180,
                    margin: EdgeInsets.only(top: (heightApp * .05)),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(top: (heightApp * 0.07)),
                  child: Text(
                    "Qué placa desea colocar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFA37136)),
                  ),
                ))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: (heightApp * 0.09)),
                    width: widthApp * 0.8,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: controllerPla,
                          decoration: InputDecoration(
                            labelText: 'Placa',
                            prefixIcon: Icon(Icons.comment),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
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
                      if ((controllerPla.text).length == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Listado(
                                  preguntaUse: preguntaUse,
                                  pregunta1: pregunta1,
                                  pregunta2: pregunta2,
                                  pregunta3: pregunta3,
                                  pregunta4: pregunta4,
                                  pregunta5: controllerPla.text)),
                        );
                      } else {
                        Toast.show("Error de placa", context,
                            duration: 1,
                            gravity: Toast.CENTER,
                            backgroundColor: Color(0xFFC6AD52),
                            textColor: Color(0xFF5C6917));
                      }
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
        )));
  }
}
