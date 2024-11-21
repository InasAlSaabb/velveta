class VariationModel {
  int? variationId;
  int? price;
  String? variationImage;
  List<String>? images;

  VariationModel(
      {this.variationId, this.price, this.variationImage, this.images});

  VariationModel.fromJson(Map<String, dynamic> json) {
    variationId = json['variation_id'];
    price = json['price'];
    variationImage = json['variation_image'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variation_id'] = this.variationId;
    data['price'] = this.price;
    data['variation_image'] = this.variationImage;
    data['images'] = this.images;
    return data;
  }
}
