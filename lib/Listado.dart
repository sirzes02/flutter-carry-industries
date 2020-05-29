import 'dart:convert';

import 'package:appcarro/Comprar.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class Listado extends StatefulWidget {
  @override
  final preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5;

  Listado(
      {Key key,
      @required this.preguntaUse,
      this.pregunta1,
      this.pregunta2,
      this.pregunta3,
      this.pregunta4,
      this.pregunta5})
      : super(key: key);
  _ListadoState createState() => _ListadoState(
      preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5);
}

class _ListadoState extends State<Listado> {
  @override
  final preguntaUse, pregunta1, pregunta2, pregunta3, pregunta4, pregunta5;
  _ListadoState(this.preguntaUse, this.pregunta1, this.pregunta2,
      this.pregunta3, this.pregunta4, this.pregunta5);
  String use = "Lista de carros sugeridos";
  var info;

  /// MARCAS
  Future<Map> tipo() async {

    var jsonData = {
    "placa": pregunta5,
      "marca": pregunta1,
      "modelo": pregunta2,
      "precio": pregunta3,  
      "tipo": pregunta4
      
    };
    final reponde = await http
        .post("http://3.16.167.111/proyectoCaro/recomendacion.php",
        body: jsonData);
    print('te amo');
    print(jsonData);

    Map dataTipo = json.decode(reponde.body);

    if (dataTipo['status']) {
      return dataTipo;
    } else if (!dataTipo['status']){
      Toast.show("La placa no es real.", context,
          duration: 1,
          gravity: Toast.CENTER,
          backgroundColor: Color.fromRGBO(132, 13, 153, .9),
          textColor: Color.fromRGBO(225, 225, 225, .9));
    }
  }

  List<String> tipos1 = ["Lista de carros sugeridos"];
  @override
  void initState() {
    super.initState();
    tipo().then((value) {
      setState(() {
        info = value;
        print(value);
      });
    });
    
  }

  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "carro  sugerido",
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
                    child: Image.asset("imagenes/porr.png"),
                    height: 180,
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
                            margin: EdgeInsets.only(top: (heightApp * 0.04)),
                            child: Text(
                                'Hola ${preguntaUse.toString()}, Carry industies te recomienda el carro con las siguientes características:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: (heightApp * 0.04)),
                            child: Text('Marca: ${(info['respuesta']['marca']??'') }',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: (heightApp * 0.02)),
                            child: Text('Modelo: ${(info['respuesta']['modelo']??'') }',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: (heightApp * 0.04)),
                            child: Text('Precio: ${(info['respuesta']['precio']??'') }',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: (heightApp * 0.04)),
                            child: Text('tipo: ${(info['respuesta']['tipo']??'') }',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: (heightApp * 0.04)),
                            child: Text('Placa: ${(info['respuesta']['placa']??'') }',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                )),
                          ), /*
                             Container(
                            margin: EdgeInsets.only(top: (heightApp * 0.04)),
                      child: Text(
                          '¿tipo: ${pregunta4.toString()}?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Montserrat",
                          ))*/
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              /*
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
                          MaterialPageRoute(builder: (context) => Comprar()),
                        );
                      },
                      child: new Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      shape: new CircleBorder(),
                      color: Color(0xFF840D99),
                    ),
                  ))
                ],
              )
              */
            ],
          ),
        ));
  }
}
