class MyOrderModel {
  int? orderId;
  String? date;
  int? price;
  String? orderStatus;
  String? image;

  MyOrderModel({
    this.orderId,
    this.date,
    this.price,
    this.orderStatus,
    this.image,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      orderId: json['order_id'],
      date: json['date'],
      price: json['price'],
      orderStatus: json['order_status'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'date': date,
      'price': price,
      'order_status': orderStatus,
      'image': image,
    };
  }
}
