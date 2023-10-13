import 'package:flutter/material.dart';
import 'package:teste_api/app/data/http/exeption.dart';
import 'package:teste_api/app/data/models/produto_model.dart';
import 'package:teste_api/app/data/repositories/produto_repository.dart';

//classe para gerenciar o estado do produto
// monitorar qanto faz a requisiçao pra api
class ProdutoStore {
  // Implemtendo o repositorio / atributo
  final IProdutoRepository repository;

  // Varialvel reativa para o loading / que leva aguem tempo até ser finalizada
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  // variavel retiva pararo state / quando termina e atualiza
  // tela com o resultaco da resposta
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  // Variavel reativa para o erro // qundo termina mais nao consegue fionalizarcom sucesso
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  // Para auterar os valores dessas variaveis precisar fazar a requisição ao repositorio

  ProdutoStore({required this.repository}); //construtor

  // Buscano o produto
  Future getProdutos() async {
    isLoading.value = true;

    try {
      // fazer requisição
      final result = await repository.getProdutos();
      // atualizar estatus
      state.value = result;
    } on NotFoundException catch (e) {
      // erro
      erro.value = e.message;
    } catch (e) {
      // erro
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
