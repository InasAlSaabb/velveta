class VariationModel {
  int? variationId;
  String? variationName;
  List<Attributes>? attributes;

  VariationModel({this.variationId, this.variationName, this.attributes});

  VariationModel.fromJson(Map<String, dynamic> json) {
    variationId = json['variation_id'];
    variationName = json['variation_name'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variation_id'] = this.variationId;
    data['variation_name'] = this.variationName;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  int? attributeId;
  String? attributeName;
  String? attributeHex;

  Attributes({this.attributeId, this.attributeName, this.attributeHex});

  Attributes.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    attributeName = json['attribute_name'];
    attributeHex = json['attribute_hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_id'] = this.attributeId;
    data['attribute_name'] = this.attributeName;
    data['attribute_hex'] = this.attributeHex;
    return data;
  }
}
