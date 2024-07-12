class CartProductModel {
  int? id;
  int? quantity;
  String? category;
  String? mainImage;
  String? name;
  String? description;
  String? material;
  String? price;
  String? discountPrice;
  Variation? variation;

  CartProductModel(
      {this.id,
      this.quantity,
      this.category,
      this.mainImage,
      this.name,
      this.description,
      this.material,
      this.price,
      this.discountPrice,
      this.variation});

  CartProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    category = json['category'];
    mainImage = json['main_image'];
    name = json['name'];
    description = json['description'];
    material = json['material'];
    price = json['price'];
    discountPrice = json['discount_price'];
    variation = json['variation'] != null
        ? new Variation.fromJson(json['variation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['main_image'] = this.mainImage;
    data['name'] = this.name;
    data['description'] = this.description;
    data['material'] = this.material;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    if (this.variation != null) {
      data['variation'] = this.variation!.toJson();
    }
    return data;
  }
}

class Variation {
  String? attribute;
  String? value;

  Variation({this.attribute, this.value});

  Variation.fromJson(Map<String, dynamic> json) {
    attribute = json['attribute'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute'] = this.attribute;
    data['value'] = this.value;
    return data;
  }
}
