import 'package:flutter/material.dart';
import 'package:flutter_app_login_bloc/src/bloc/login_bloc.dart';
import 'package:flutter_app_login_bloc/src/bloc/productos_bloc.dart';
export 'package:flutter_app_login_bloc/src/bloc/login_bloc.dart';
export 'package:flutter_app_login_bloc/src/bloc/productos_bloc.dart';
class Provider extends InheritedWidget {
  
  final loginBloc = new LoginBLoc();
  final _productosBloc = new Productobloc();


  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  //Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBLoc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static Productobloc productosBloc (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._productosBloc;
  }
}
