class OrderByIdAllInfoModel {
  int? orderId;
  String? date;
  String? location;
  int? price;
  String? orderStatus;
  List<Products>? products;
  int? shipping;
  int? totalPrice;

  OrderByIdAllInfoModel(
      {this.orderId,
      this.date,
      this.location,
      this.price,
      this.orderStatus,
      this.products,
      this.shipping,
      this.totalPrice});

  OrderByIdAllInfoModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    date = json['date'];
    location = json['location'];
    price = json['price'];
    orderStatus = json['order_status'];
    if (json['products'] != null) {
      List<Products> products = <Products>[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    shipping = json['shipping'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['date'] = this.date;
    data['location'] = this.location;
    data['price'] = this.price;
    data['order_status'] = this.orderStatus;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['shipping'] = this.shipping;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class Products {
  int? id;
  int? categoryId;
  int? variationId;
  int? hasCandle;
  Attributes? attributes;
  String? mainImage;
  String? name;
  int? price;
  int? discountPrice;

  Products(
      {this.id,
      this.categoryId,
      this.variationId,
      this.hasCandle,
      this.attributes,
      this.mainImage,
      this.name,
      this.price,
      this.discountPrice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
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
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
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
