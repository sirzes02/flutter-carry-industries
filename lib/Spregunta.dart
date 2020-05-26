import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Tpregunta.dart';

class Spregunta extends StatefulWidget {
  @override
  _SpreguntaoState createState() => _SpreguntaoState();
}

class _SpreguntaoState extends State<Spregunta> {
 @override
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
            "Carro",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .9),
                fontFamily: "flower",
                fontSize: 30,
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
                    child: Image.asset("imagenes/carros.png"),
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: (heightApp * 0.1)),
                          alignment: Alignment.center,
                          child: const Text('¿Qué modelo de carro desea usted?',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(48, 48, 48, .9))),
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
                    
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: widthApp * 0.8,
                    margin: EdgeInsets.only(top: (heightApp * 0.06)),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: use,
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
              Row(children: <Widget>[
                Expanded(child: Container(
                height: 50.0,
                margin: EdgeInsets.only(top: (heightApp * 0.25)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tpregunta()),
                    );
                  },
                  child: new Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  shape: new CircleBorder(),
                  color: Colors.black12,
                ),
              ))
              ],)
            ],
          ),
        ));
  }
}
