class FavoriteModel {
  int? id;
  int? variationId;
  Attributes? attributes;
  String? mainImage;
  String? name;
  String? price;
  String? discountPrice;

  FavoriteModel(
      {this.id,
      this.variationId,
      this.attributes,
      this.mainImage,
      this.name,
      this.price,
      this.discountPrice});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    variationId = json['variation_id'];
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
    data['id'] = this.id;
    data['variation_id'] = this.variationId;
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
