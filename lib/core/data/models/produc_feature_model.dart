class ProductFearuresModel {
  int? id;
  int? categoryId;
  String? mainImage;
  String? name;
  Null material;
  String? description;
  int? price;
  String? images;
  List<Variations>? variations;

  ProductFearuresModel(
      {this.id,
      this.categoryId,
      this.mainImage,
      this.name,
      this.material,
      this.description,
      this.price,
      this.images,
      this.variations});

  ProductFearuresModel.fromJson(Map<String, dynamic> json) {
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
        if (json['variations'] != null) {
          variations!.add(new Variations.fromJson(v));
        }
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
  int? variationGroupId;
  Attributes? attributes;
  AttributesId? attributesId;
  int? price;
  int? discount;
  int? stockQuantity;
  String? image;
  List<String>? variationImages;

  Variations(
      {this.variationGroupId,
      this.attributes,
      this.attributesId,
      this.price,
      this.discount,
      this.stockQuantity,
      this.image,
      this.variationImages});

  Variations.fromJson(Map<String, dynamic> json) {
    variationGroupId = json['variation_group_id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    attributesId = json['attributes_id'] != null
        ? new AttributesId.fromJson(json['attributes_id'])
        : null;
    price = json['price'];
    discount = json['discount'];
    stockQuantity = json['stock_quantity'];
    image = json['image'];
    variationImages = json['variation_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variation_group_id'] = this.variationGroupId;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    if (this.attributesId != null) {
      data['attributes_id'] = this.attributesId!.toJson();
    }
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['stock_quantity'] = this.stockQuantity;
    data['image'] = this.image;
    data['variation_images'] = this.variationImages;
    return data;
  }
}

class Attributes {
  String? color;
  String? hex;
  String? boxSize;
  String? material;

  Attributes({this.color, this.hex, this.boxSize, this.material});

  Attributes.fromJson(Map<String, dynamic> json) {
    color = json['Color'];
    hex = json['hex'];
    boxSize = json['Box size'];
    material = json['Material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Color'] = this.color;
    data['hex'] = this.hex;
    data['Box size'] = this.boxSize;
    data['Material'] = this.material;
    return data;
  }
}

class AttributesId {
  int? i1;
  int? i2;
  int? i4;

  AttributesId({this.i1, this.i2, this.i4});

  AttributesId.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i4 = json['4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['4'] = this.i4;
    return data;
  }
}
