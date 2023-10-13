import 'package:http/http.dart' as http;

// classe contrato
abstract class IHttpClient {
  Future get({required String url});
}

// concreta
class HttpClient implements IHttpClient {
  // importa o http
  // instanciar http
  final client = http.Client();

  @override
  Future get({required String url}) async {
    // esoerar o retorm=nod requisião
    return await client.get(Uri.parse(url));
  }
}
