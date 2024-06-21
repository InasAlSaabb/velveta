class ProductsByIDModel {
  int? id;
  String? mainImage;
  String? name;
  String? description;
  String? material;
  String? price;
  bool? isFavorited;

  ProductsByIDModel(
      {this.id,
      this.mainImage,
      this.name,
      this.description,
      this.material,
      this.price,
      this.isFavorited});

  ProductsByIDModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainImage = json['main_image'];
    name = json['name'];
    description = json['description'];
    material = json['material'];
    price = json['price'];
    isFavorited = json['is_favorited'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_image'] = this.mainImage;
    data['name'] = this.name;
    data['description'] = this.description;
    data['material'] = this.material;
    data['price'] = this.price;
    data['is_favorited'] = this.isFavorited;
    return data;
  }
}
