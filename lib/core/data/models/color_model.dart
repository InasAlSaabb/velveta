class ColorModel {
  int? id;
  String? name;
  String? hex;

  ColorModel({this.id, this.name, this.hex});

  ColorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hex = json['hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hex'] = this.hex;
    return data;
  }
}
