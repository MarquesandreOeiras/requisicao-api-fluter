class ProdutoModel {

  // Atributos
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  // Construtor
  ProdutoModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  //Construtor nomeado
  //Criar um produto model apartir de um map
  //Vai receber um Map de valor String com varios tipos dinamicos, conforme o retorna do json
  factory ProdutoModel.fromMap(Map<String, dynamic> map) { // dynamic por não saber o tipo de dado 
    return ProdutoModel(
        title: map['title'],
        description: map['description'],
        price: map['price'] * 1.0,
        rating: map['rating'] * 1.0,
        brand: map['brand'],
        category: map['category'],
        thumbnail: map['thumbnail'],
        images: List<String>.from(map['images'] as List));
  }
}
