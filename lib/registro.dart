import 'dart:convert';
import 'package:appcarro/login.dart';
import 'package:flutter/material.dart';
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
    final reponde =
        await http.post("http://3.16.167.111/Carry-industries/register.php", body: {
      "nombre": controllerNom.text,
      "apellido": controllerApe.text,
      "telefono": controllerCel.text,
      "correo": controllerEmail.text,
      "contra": controllerPass.text,
      "contraV": controllerPassConf.text
    });

    var dataUser = json.decode(reponde.body);

    if (dataUser["status"]) {
      Toast.show("Creaste la cuenta", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER,
          backgroundColor: Color.fromRGBO(132, 13, 153, .9),
          textColor: Color.fromRGBO(225, 225, 225, .9));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else if (!dataUser["status"]) {
      Toast.show("${dataUser['problem']}", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER,
          backgroundColor: Color(0xFFC6AD52),
          textColor: Color(0xFF5C6917));
    }
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
                  height: 260,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: heightApp * 0.0001),
                child: Text(
                  "Carry Industries",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFC6AD52)),
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
                                  labelText: 'Nombre Completo',
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
                            ),
                            Container(
                              margin: EdgeInsets.only(top: (heightApp * 0.015)),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: controllerPassConf,
                                    obscureText: true,
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
                        onPressed: () {
                          crearCuenta();
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
                                maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Crear Cuenta",
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
            ],
          ),
        ],
      ),
    ));
  }
}
