import 'package:flutter/material.dart';
import 'package:appcarro/colores.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(132, 13, 153, .6),
                        Color.fromRGBO(132, 13, 153, .9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Image.asset(""),
                            height: 300,
                          ),
                          Container(
                              child: Text(
                                "Carros",
                                style: TextStyle(
                                  fontFamily: "flower",
                                  color: Color.fromRGBO(0, 0, 0, .9),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: (heightApp * 0.03)))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                                  //fontFamily: "flower",
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
