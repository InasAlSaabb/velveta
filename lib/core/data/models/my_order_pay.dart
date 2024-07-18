import 'dart:convert';

class OrderPayModel {
  int? customerId;
  String? addressId;
  String? customerName;
  String? email;
  String? countryCode;
  String? customerPhone;
  int? orderPrice;
  int? discountPrice;
  String? paymentMethod;
  String? updatedAt;
  String? createdAt;
  int? id;

  OrderPayModel(
      {this.customerId,
      this.addressId,
      this.customerName,
      this.email,
      this.countryCode,
      this.customerPhone,
      this.orderPrice,
      this.discountPrice,
      this.paymentMethod,
      this.updatedAt,
      this.createdAt,
      this.id});

  OrderPayModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    addressId = json['address_id'];
    customerName = json['customer_name'];
    email = json['email'];
    countryCode = json['country_code'];
    customerPhone = json['customer_phone'];
    orderPrice = json['order_price'];
    discountPrice = json['discount_price'];
    paymentMethod = json['payment_method'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['address_id'] = this.addressId;
    data['customer_name'] = this.customerName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['customer_phone'] = this.customerPhone;
    data['order_price'] = this.orderPrice;
    data['discount_price'] = this.discountPrice;
    data['payment_method'] = this.paymentMethod;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }

  static String encode(OrderPayModel order) {
    return json.encode(order.toJson());
  }

  static OrderPayModel decode(String str) {
    final jsonData = json.decode(str);
    return OrderPayModel.fromJson(jsonData);
  }
}
