// class ProductFearuresModel {
//   int? id;
//   int? categoryId;
//   String? mainImage;
//   String? name;
//   String? material;
//   String? description;
//   String? price;
//   List<Images>? images;
//   List<Variations>? variations;

//   ProductFearuresModel(
//       {this.id,
//       this.categoryId,
//       this.mainImage,
//       this.name,
//       this.material,
//       this.description,
//       this.price,
//       this.images,
//       this.variations});

//   ProductFearuresModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryId = json['category_id'];
//     mainImage = json['main_image'];
//     name = json['name'];
//     material = json['material'];
//     description = json['description'];
//     price = json['price'];
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//     if (json['variations'] != null) {
//       variations = <Variations>[];
//       json['variations'].forEach((v) {
//         variations!.add(new Variations.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['category_id'] = this.categoryId;
//     data['main_image'] = this.mainImage;
//     data['name'] = this.name;
//     data['material'] = this.material;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     if (this.variations != null) {
//       data['variations'] = this.variations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Images {
//   int? id;
//   String? path;
//   int? imageableId;
//   String? imageableType;
//   String? createdAt;
//   String? updatedAt;

//   Images(
//       {this.id,
//       this.path,
//       this.imageableId,
//       this.imageableType,
//       this.createdAt,
//       this.updatedAt});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     path = json['path'];
//     imageableId = json['imageable_id'];
//     imageableType = json['imageable_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['path'] = this.path;
//     data['imageable_id'] = this.imageableId;
//     data['imageable_type'] = this.imageableType;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Variations {
//   int? variationId;
//   Attributes? attributes;
//   String? price;
//   String? discount;
//   int? stockQuantity;
//   String? image;

//   Variations(
//       {this.variationId,
//       this.attributes,
//       this.price,
//       this.discount,
//       this.stockQuantity,
//       this.image});

//   Variations.fromJson(Map<String, dynamic> json) {
//     variationId = json['variation_id'];
//     attributes = json['attributes'] != null
//         ? new Attributes.fromJson(json['attributes'])
//         : null;
//     price = json['price'];
//     discount = json['discount'];
//     stockQuantity = json['stock_quantity'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['variation_id'] = this.variationId;
//     if (this.attributes != null) {
//       data['attributes'] = this.attributes!.toJson();
//     }
//     data['price'] = this.price;
//     data['discount'] = this.discount;
//     data['stock_quantity'] = this.stockQuantity;
//     data['image'] = this.image;
//     return data;
//   }
// }

// class Attributes {
//   String? color;
//   String? hex;
//   String? boxShape;

//   Attributes({this.color, this.hex, this.boxShape});

//   Attributes.fromJson(Map<String, dynamic> json) {
//     color = json['Color'];
//     hex = json['hex'];
//     boxShape = json['Box Shape'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Color'] = this.color;
//     data['hex'] = this.hex;
//     data['Box Shape'] = this.boxShape;
//     return data;
//   }
// }
class ProductFearuresModel {
  int? id;
  int? categoryId;
  String? mainImage;
  String? name;
  String? material;
  String? description;
  int? price;
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

  ProductFearuresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    mainImage = json['main_image'];
    name = json['name'];
    material = json['material'];
    description = json['description'];
    price = json['price'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
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
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
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
  int? price;
  int? discount;
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
