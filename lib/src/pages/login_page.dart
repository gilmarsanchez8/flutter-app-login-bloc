import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _crearFondo(context),
      ],
    ));
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoSuperiorLogin = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(239, 197, 202, 1.0),
        Color.fromRGBO(186, 39, 55, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.black12
      ),
    );

    return Stack(
      children: [
        fondoSuperiorLogin,
        Positioned(child: circulo, top: 90.0,left: 30.0),
        Positioned(child: circulo, top: -40.0, right: -30.0),
        Positioned(child: circulo, bottom: -50.0, left: -10.0),
        Positioned(child: circulo, bottom: -10.0, right: -30.0),

        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity,),
              Text('Gilmar', style: TextStyle(color: Colors.white, fontSize: 25.0)),

            ],
          ),
        )
      ],
    );
  }
}
