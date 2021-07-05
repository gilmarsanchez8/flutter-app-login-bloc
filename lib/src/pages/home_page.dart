import 'package:flutter/material.dart';
import 'package:flutter_app_login_bloc/src/bloc/provider.dart';
import 'package:flutter_app_login_bloc/src/models/producto_model.dart';
import 'package:flutter_app_login_bloc/src/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(Productobloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) =>
                _crearItem(context, productos[i], productosBloc),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto,
      Productobloc productosBloc) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.blue,
        ),
        onDismissed: (direccion) {
          //productosProvider.borrarProducto(producto.id);
          productosBloc.borrarProducto(producto.id);
        },
        child: Card(
          child: Column(
            children: [
              (producto.fotoUrl == null)
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(producto.fotoUrl),
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ListTile(
                  title: Text('${producto.titulo} - ${producto.valor}'),
                  subtitle: Text(producto.id),
                  onTap: () => Navigator.pushNamed(context, 'producto',
                      arguments: producto)),
            ],
          ),
        ));
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.red,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}
