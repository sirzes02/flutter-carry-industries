import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Listado.dart';

class Comprar extends StatefulWidget {
  @override
  _ComprarState createState() => _ComprarState();
}

class _ComprarState extends State<Comprar> {
  TextEditingController controllerPla = new TextEditingController();

  Future<List> login() async {
    final reponde = await http.post(
        "http://3.16.167.111/proyectoCaro/login.php",
        body: {"placa": controllerPla.text});

    var dataUser = json.decode(reponde.body);
    print(dataUser["status"]);
    if (dataUser["status"]) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Listado()),
      );
    } else if (!dataUser["status"]) {
      Toast.show("error de placa", context,
          duration: 1,
          gravity: Toast.CENTER,
          backgroundColor: Color.fromRGBO(132, 13, 153, .9),
          textColor: Color.fromRGBO(225, 225, 225, .9));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Comprar",
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
                  child: AnimatedContainer(
                    duration: Duration(seconds: 5),
                    width: widthApp * 100,
                    alignment: Alignment.center,
                    child: Image.asset("imagenes/carros.png"),
                    height: 300,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  child: Text(
                    "Elegiste este carro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ))
              ],
            ),
          ],
        )));
  }
}
