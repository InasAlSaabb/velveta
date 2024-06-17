class ProductIdModel {
  int? id;
  int? categoryId;
  String? mainImage;
  String? name;
  String? material;
  String? description;
  String? price;
  String? images;
  List<Variations>? variations;

  ProductIdModel(
      {this.id,
      this.categoryId,
      this.mainImage,
      this.name,
      this.material,
      this.description,
      this.price,
      this.images,
      this.variations});

  ProductIdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    mainImage = json['main_image'];
    name = json['name'];
    material = json['material'];
    description = json['description'];
    price = json['price'];
    images = json['images'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['main_image'] = this.mainImage;
    data['name'] = this.name;
    data['material'] = this.material;
    data['description'] = this.description;
    data['price'] = this.price;
    data['images'] = this.images;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variations {
  int? variationId;
  Attributes? attributes;
  String? price;
  String? discount;
  int? stockQuantity;
  String? image;

  Variations(
      {this.variationId,
      this.attributes,
      this.price,
      this.discount,
      this.stockQuantity,
      this.image});

  Variations.fromJson(Map<String, dynamic> json) {
    variationId = json['variation_id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    price = json['price'];
    discount = json['discount'];
    stockQuantity = json['stock_quantity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variation_id'] = this.variationId;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['stock_quantity'] = this.stockQuantity;
    data['image'] = this.image;
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
