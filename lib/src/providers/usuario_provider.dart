import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyA_FYh5dMG5jos4XyS_nxFTAwS3xPPKjd4';

  Future nuevoUsuario(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        Uri.parse(
            'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$_firebaseToken'),
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      //TODO: Salvar token en storage
      return {'OK': true, 'token': decodedResp['idToken']};
    } else {
      return {'OK': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
