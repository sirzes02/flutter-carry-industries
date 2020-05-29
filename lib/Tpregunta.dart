import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Cpregunta.dart';
import 'package:flutter_masked_text/flutter_masked_text.Dart';
class Tpregunta extends StatefulWidget {
  @override
  final preguntaUse, pregunta1, pregunta2, pregunta3;

  Tpregunta(
      {Key key,
      @required this.preguntaUse,
      this.pregunta1,
      this.pregunta2,
      this.pregunta3})
      : super(key: key);
  _TpreguntaoState createState() =>
      _TpreguntaoState(preguntaUse, pregunta1, pregunta2, pregunta3);
}

class _TpreguntaoState extends State<Tpregunta> {
  @override

  final preguntaUse, pregunta1, pregunta2, pregunta3;
  _TpreguntaoState(
      this.preguntaUse, this.pregunta1, this.pregunta2, this.pregunta3);
  String use = "Selecione el precio";
  var info;
  var moneyController = new MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',', leftSymbol: ' \$');

  /// MARCAS
  Future<List> precios() async {
    final reponde =
        await http.post("http://3.16.167.111/proyectoCaro/listaPrecio.php");

    var dataPre = json.decode(reponde.body);

    if (dataPre.length > 0) {
      return dataPre;
    } else {
      Toast.show("error", context,
          duration: 1,
          gravity: Toast.CENTER,
          backgroundColor: Color.fromRGBO(132, 13, 153, .9),
          textColor: Color.fromRGBO(225, 225, 225, .9));
    }
  }

  List<String> precios1 = ["Selecione el precio"];
  @override
  void initState() {
    super.initState();
    precios().then((value) {
      setState(() {
        value.forEach((val) {
          precios1.add(val);
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
            "Precio",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .9),
                fontFamily: "Montserrat",
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
                    child: Image.asset("imagenes/desss.png"),
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
                      child: Text('¿Qué precios de carro desea usted?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                          )),
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
                            items: precios1.map((String e) {
                              String cont1;
                              if(e=="Selecione el precio"){
                                cont1="0";
                              }
                              else cont1=e;
                              double cont= double.parse(cont1);
                              moneyController.updateValue(cont);
                              return DropdownMenuItem<String>(
                                child:Text(moneyController.text),
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
                              builder: (context) => Cpregunta(
                                  preguntaUse: preguntaUse,
                                  pregunta1: pregunta1,
                                  pregunta2: pregunta2,
                                  pregunta3: use)),
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
            ],
          ),
        ));
  }
}
