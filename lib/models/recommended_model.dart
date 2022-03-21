class Recommended {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  List<ProductModel> get products=> _products;

  Recommended({required totalSize,
    required typeId,
    required offset,
    required products}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Recommended.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        products.add(ProductModel.fromJson(v));
      });
    }
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> logic.data = Map<String, dynamic>();
//   logic.data['total_size'] = totalSize;
//   logic.data['type_id'] = typeId;
//   logic.data['offset'] = offset;
//   if (products != null) {
//     logic.data['products'] = products!.map((v) => v.toJson()).toList();
//   }
//   return logic.data;
// }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> logic.data =  Map<String, dynamic>();
//   logic.data['id'] = id;
//   logic.data['name'] = name;
//   logic.data['description'] = description;
//   logic.data['price'] = price;
//   logic.data['stars'] = stars;
//   logic.data['img'] = img;
//   logic.data['location'] = location;
//   logic.data['created_at'] =createdAt;
//   logic.data['updated_at'] = updatedAt;
//   logic.data['type_id'] = typeId;
//   return logic.data;
// }
}