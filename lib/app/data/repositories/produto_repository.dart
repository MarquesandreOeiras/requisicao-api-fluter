import 'dart:convert';
import 'package:teste_api/app/data/http/exeption.dart';
import 'package:teste_api/app/data/http/http_cliet.dart';
import 'package:teste_api/app/data/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IProdutoRepository {
  // varialvel para fazer a requisição
  final IHttpClient client;

  ProdutoRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    // Faz a reiquisição e armazena na varialvel response
    final response = await client.get(
      url: 'https://dummyjson.com/products',
    );

    // verificação o statuCode (se der certo)
    if (response.statusCode == 200) {
      // Lista de produtos vazia
      final List<ProdutoModel> produtos = [];
      // decodificar o body que ta na variavel response. que é onde ta os dadosdos produtos
      // vair reseber ma fulçao e transformar para MAP
      final body = jsonDecode(response.body); 

      // body vai acessar a chave e chamar o map e dentro passar uma funnçao anonima que vai
      // pecorrer todos esse intens na lista
      body['products'].map((item) {
        // Criar nv produtoModel and add list do produtoModel.fromMap
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        //add in list em cima
        produtos.add(produto);
      }).toList();// para conseguir executart o metudo ai dentro

      // retorna lista de produtos
      return produtos;

    // se não der certo .pecistencia
    } else if (response.statusCode == 404) { //404 não encontra a url
      // throw para lança exesao
      throw NotFoundException(message: 'A url informada não é válida');
    } else {
      // se ouver problem
      throw Exception('Não possivel carregar os produtos');
    }
  }
}
