import 'package:flutter/material.dart';

class Ppregunta extends StatefulWidget {
  @override
  _PpreguntaoState createState() => _PpreguntaoState();
}

class _PpreguntaoState extends State<Ppregunta> {
  @override
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
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: Image.asset("a.png"),
                height: 180,
                margin: EdgeInsets.only(top: (heightApp * .05)),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    width: widthApp*0.8,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: (heightApp * 0.035)),
                      alignment: Alignment.center,
                      child: const Text('Hola',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color.fromRGBO(48, 48, 48, .9))),
                    ),
                   
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
