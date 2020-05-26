import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:appcarro/Ppregunta.dart';


class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  @override
  Widget build(BuildContext context) {
    double widthApp = MediaQuery.of(context).size.width;
    double heightApp = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inicio",
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, .9),
              fontFamily: "flower",
              fontSize: 30,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child:Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Image.asset("imagenes/a.png"),
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
                      alignment: Alignment.center,
                      child: const Text('Carry Industrial',
                          style: TextStyle(
                              fontSize:30 ,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF840D99))),
                    ),
                    Container(
                      width: widthApp*0.88,
                        margin: EdgeInsets.only(top: (heightApp * 0.06)),
                        child: Text(
                          "La mejor opcion para decidir la compra de su carro ideal, en el concesionario Luxy Cars",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black),
                        )),
                    Container(
                        height: 50.0,
                margin: EdgeInsets.only(top: (heightApp * 0.03)),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ppregunta()),
                    );
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
                        "Comenzar",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),)
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
      )
    );
  }
}
