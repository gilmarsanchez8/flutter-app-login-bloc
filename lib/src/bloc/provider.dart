import 'package:flutter/material.dart';
import 'package:flutter_app_login_bloc/src/bloc/login_bloc.dart';
export 'package:flutter_app_login_bloc/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBLoc();

  Provider({Key key, Widget child}) 
  : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBLoc of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
