class ProductFearuresModel {
  int? id;
  int? categoryId;
  String? mainImage;
  String? name;
  String? material;
  String? description;
  String? price;
  List<Images>? images;
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
  factory ProductFearuresModel.fromJson(Map<String, dynamic> json) {
    final List<Images>? defaultImages = <Images>[];
    final List<Variations>? defaultVariations = <Variations>[];

    return ProductFearuresModel(
      id: json['id'],
      categoryId: json['category_id'],
      mainImage: json['main_image'],
      name: json['name'],
      material: json['material'],
      description: json['description'],
      price: json['price'],
      images: parseImages(json['images']) ?? defaultImages,
      variations: (json['variations'] as List<dynamic>?)
              ?.map((v) => Variations.fromJson(v))
              .toList() ??
          defaultVariations,
    );
  }

  static List<Images>? parseImages(imagesJson) {
    if (imagesJson != null) {
      if (imagesJson is List<dynamic>) {
        return imagesJson.map((v) => Images.fromJson(v)).toList();
      } else if (imagesJson is String) {
        // Handle the case when imagesJson is a single image URL string
        return [
          Images.fromJson({'url': imagesJson})
        ];
      }
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['main_image'] = mainImage;
    data['name'] = name;
    data['material'] = material;
    data['description'] = description;
    data['price'] = price;
    data['images'] = images?.map((v) => v.toJson()).toList();
    data['variations'] = variations?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Images {
  int? id;
  String? path;
  int? imageableId;
  String? imageableType;
  String? createdAt;
  String? updatedAt;

  Images(
      {this.id,
      this.path,
      this.imageableId,
      this.imageableType,
      this.createdAt,
      this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['imageable_id'] = this.imageableId;
    data['imageable_type'] = this.imageableType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Variations {
  int? variationGroupId;
  Attributes? attributes;
  AttributesId? attributesId;
  String? price;
  String? discount;
  int? stockQuantity;
  String? image;

  Variations(
      {this.variationGroupId,
      this.attributes,
      this.attributesId,
      this.price,
      this.discount,
      this.stockQuantity,
      this.image});

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
    return data;
  }
}

class Attributes {
  String? color;
  String? hex;
  String? boxShape;

  Attributes({this.color, this.hex, this.boxShape});
  Attributes.fromJson(Map<String, dynamic> json) {
    color = json['Color'];
    hex = json['hex'];
    boxShape = json['Box Shape'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Color'] = this.color;
    data['hex'] = this.hex;
    data['Box Shape'] = this.boxShape;
    return data;
  }
}

class AttributesId {
  int? i1;
  int? i2;
  String? hex;

  AttributesId({this.i1, this.i2, this.hex});

  AttributesId.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    hex = json['hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['hex'] = this.hex;
    return data;
  }
}
