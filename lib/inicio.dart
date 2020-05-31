import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Ppregunta.dart';

class Inicio extends StatefulWidget {
  @override
  final preguntaUse;

  Inicio({Key key, @required this.preguntaUse}) : super(key: key);
  _InicioState createState() => _InicioState(preguntaUse);
}

class _InicioState extends State<Inicio> {
  @override
  final preguntaUse;
  _InicioState(this.preguntaUse);
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Inicio",
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
                    child: Image.asset("imagenes/aaa.png"),
                    height: 200,
                    margin: EdgeInsets.only(top: (heightApp * .05)),
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
                          margin: EdgeInsets.only(top: (heightApp * 0.035)),
                          child: Text('Carry Industries',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFC6AD52))),
                        ),
                        Container(
                            width: widthApp * 0.8,
                            margin: EdgeInsets.only(top: (heightApp * 0.04)),
                            child: Text(
                              "La mejor opción para decidir la compra de su carro ideal, en el concesionario Luxy Cars",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                  color: Color.fromRGBO(48, 48, 48, .8)),
                            )),
                        Container(
                          height: 50.0,
                          margin: EdgeInsets.only(top: (heightApp * 0.13)),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ppregunta(
                                          preguntaUse: preguntaUse,
                                        )),
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(101, 115, 26, .5),
                                      Color.fromRGBO(101, 115, 26, .7),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 210.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Comenzar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Montserrat",
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ],
          ),
        ));
  }
}
