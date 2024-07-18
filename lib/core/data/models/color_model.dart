class ColorModel {
  int? price;
  String? image;
  int? varaitionId;
  int? colorId;
  String? colorName;
  String? colorHex;

  ColorModel(
      {this.price,
      this.image,
      this.varaitionId,
      this.colorId,
      this.colorName,
      this.colorHex});

  ColorModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    image = json['image'];
    varaitionId = json['varaition_id'];
    colorId = json['color_id'];
    colorName = json['color_name'];
    colorHex = json['color_hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['image'] = this.image;
    data['varaition_id'] = this.varaitionId;
    data['color_id'] = this.colorId;
    data['color_name'] = this.colorName;
    data['color_hex'] = this.colorHex;
    return data;
  }
}
