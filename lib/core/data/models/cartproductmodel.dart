class CartProductModel {
  int? id;
  int? quantity;
  String? category;
  String? mainImage;
  String? name;
  String? description;
  String? material;
  int? price;
  int? hasCandle;
  int? discountPrice;
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
      this.hasCandle,
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
    hasCandle = json['has_candle'];
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
    data['has_candle'] = this.hasCandle;
    data['discount_price'] = this.discountPrice;
    if (this.variation != null) {
      data['variation'] = this.variation!.toJson();
    }
    return data;
  }
}

class Variation {
  String? color;
  String? boxShape;

  Variation({this.color, this.boxShape});

  Variation.fromJson(Map<String, dynamic> json) {
    color = json['Color'];
    boxShape = json['Box Shape'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Color'] = this.color;
    data['Box Shape'] = this.boxShape;
    return data;
  }
}
