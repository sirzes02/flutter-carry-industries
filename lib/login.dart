import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:appcarro/inicio.dart';
import 'package:appcarro/registro.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  final preguntaUse;

  Login({Key key, @required this.preguntaUse}) : super(key: key);
  _LoginState createState() => _LoginState(preguntaUse);
}

class _LoginState extends State<Login> {
  @override
  final preguntaUse;
  _LoginState(this.preguntaUse);
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  Future<List> login() async {
    final reponde = await http.post(
        "http://3.16.167.111/proyectoCaro/login.php",
        body: {"correo": controllerUser.text, "contra": controllerPass.text});

    var dataUser = json.decode(reponde.body);
    print(dataUser["status"]);
    if (dataUser["status"]) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Inicio(preguntaUse: controllerUser.text)),
      );
    } else if (!dataUser["status"]) {
      Toast.show("Login Incorrecto", context,
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
                "Carry Industries",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF840D99)),
              ),
            ))
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Center(
              child: Container(
                margin: EdgeInsets.only(top: (heightApp * 0.05)),
                width: widthApp * 0.75,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: controllerUser,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: (heightApp * 0.02)),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: controllerPass,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                labelText: 'Contraseña',
                                prefixIcon: Icon(Icons.lock)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Center(
              child: Container(
                height: 50.0,
                margin: EdgeInsets.only(top: (heightApp * 0.03)),
                child: RaisedButton(
                  onPressed: () {
                    login();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(132, 13, 153, .6),
                            Color.fromRGBO(132, 13, 153, .9),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Iniciar sesión",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
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
                      margin: EdgeInsets.only(top: (heightApp * 0.07)),
                      child: Text(
                        "Si no tienes una cuenta puedes crearla aquí:",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Color.fromRGBO(48, 48, 48, .7)),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: (heightApp * 0.02)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Registro()),
                          );
                        },
                        child: const Text('Registrarse',
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                color: Color(0xFF840D99))),
                      ))
                ],
              ),
            ))
          ],
        ),
      ],
    )));
  }
}
