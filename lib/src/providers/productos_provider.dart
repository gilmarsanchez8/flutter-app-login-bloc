import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_app_login_bloc/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://flutter-apps-39584-default-rtdb.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';
    final resp = await http.post( Uri.parse(url), body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}
