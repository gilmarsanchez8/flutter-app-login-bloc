import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_app_login_bloc/src/models/producto_model.dart';

class ProductosProvider {
  final String _url = 'https://flutter-apps-39584-default-rtdb.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';
    final resp =
        await http.post(Uri.parse(url), body: productoModelToJson(producto));
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json';
    final resp = await http.get(Uri.parse(url));
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();
    if (decodedData == null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;

      productos.add(prodTemp);
    });

    return productos;
  }

  Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json';
    final resp = await http.delete(Uri.parse(url));
    print(json.decode(resp.body));
    return 1;
  }
}