class FavoriteModel {
  int? productId;
  int? quantity;
  int? variationId;
  int? hasCandle;
  Attributes? attributes;
  String? mainImage;
  String? name;
  int? price;
  int? discountPrice;

  FavoriteModel(
      {this.productId,
      this.quantity,
      this.variationId,
      this.hasCandle,
      this.attributes,
      this.mainImage,
      this.name,
      this.price,
      this.discountPrice});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'] ?? 1;
    variationId = json['variation_id'];
    hasCandle = json['has_candle'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    mainImage = json['main_image'];
    name = json['name'];
    price = json['price'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['variation_id'] = this.variationId;
    data['has_candle'] = this.hasCandle;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    data['main_image'] = this.mainImage;
    data['name'] = this.name;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    return data;
  }
}

class Attributes {
  String? color;
  String? boxShape;

  Attributes({this.color, this.boxShape});

  Attributes.fromJson(Map<String, dynamic> json) {
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
