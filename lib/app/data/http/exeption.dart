// clsse que vai implementar a claase exeception do dart
class NotFoundException implements Exception {
  // atributo ajusad apersonalisar a mensagem
  final String message;

  NotFoundException({required this.message});
}
