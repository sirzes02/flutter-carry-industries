import 'dart:convert';
import 'package:appcarro/login.dart';
import 'package:flutter/material.dart';
import 'package:appcarro/colores.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
 TextEditingController controllerNom = new TextEditingController();
 TextEditingController controllerApe = new TextEditingController();
 TextEditingController controllerCel = new TextEditingController();
 TextEditingController controllerEmail = new TextEditingController();
 TextEditingController controllerPass = new TextEditingController();
 TextEditingController controllerPassConf = new TextEditingController();
 
  Future<List> crearCuenta() async {
    final reponde = await http.post("", body: {
      "Nombre": controllerNom.text,
      "Apellido": controllerApe.text,
      "Celular": controllerCel.text,
      "Email": controllerEmail.text,
      "contrasena": controllerPass.text,
      "contrasenaConf": controllerPassConf.text
    });

    var dataUser = json.decode(reponde.body);
    if (dataUser == "Correcto") {
      Toast.show("CORRECTO", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER,
          backgroundColor: Colors.blue,
          textColor: Colors.white);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else if (dataUser == "Incorrecto") {
      Toast.show("incorrecto", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER,
          backgroundColor: Colors.blue,
          textColor: Colors.white);
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
      body: Column(
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
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF840D99)),
                ),
              ))
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Container(
                        width: widthApp * 0.8,
                        margin: EdgeInsets.only(top: heightApp * 0.03),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: controllerNom,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: 'Nombre',
                                  prefixIcon: Icon(Icons.person)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: (heightApp * 0.015)),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: controllerApe,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        labelText: 'Apellido',
                                        prefixIcon: Icon(Icons.person)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: (heightApp * 0.015)),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: controllerEmail,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        labelText: 'Email',
                                        prefixIcon: Icon(Icons.email)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: (heightApp * 0.015)),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: controllerCel,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        labelText: 'Celular',
                                        prefixIcon: Icon(Icons.phone_android)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: (heightApp * 0.015)),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: controllerPass,
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
                            ),
                            Container(
                              margin: EdgeInsets.only(top: (heightApp * 0.015)),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: controllerPassConf,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          ),
                                        ),
                                        labelText: 'Confirmar Contraseña',
                                        prefixIcon: Icon(Icons.lock)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
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
                        onPressed: () {},
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
                            constraints: BoxConstraints(
                                maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Crear cuenta",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
