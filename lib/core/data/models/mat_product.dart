class VariationsModel {
  List<Variation>? variations;
  Map<String, List<AttributeGrouped>>? attributesGrouped;

  VariationsModel({
    this.variations,
    this.attributesGrouped,
  });

  factory VariationsModel.fromJson(Map<String, dynamic> json) {
    return VariationsModel(
      variations: json['variations'] != null
          ? (json['variations'] as List)
              .map((e) => Variation.fromJson(e))
              .toList()
          : null,
      attributesGrouped: json['attributesGrouped'] != null
          ? (json['attributesGrouped'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(
                key,
                (value as List)
                    .map((e) => AttributeGrouped.fromJson(e))
                    .toList(),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'variations': variations?.map((e) => e.toJson()).toList(),
        'attributesGrouped': attributesGrouped?.map(
          (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
        ),
      };
}

class Variation {
  final int? variationId;
  final String? variationName;
  final List<Attribute>? attributes;

  Variation({
    this.variationId,
    this.variationName,
    this.attributes,
  });

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      variationId: json['variation_id'],
      variationName: json['variation_name'],
      attributes: json['attributes'] != null
          ? (json['attributes'] as List)
              .map((e) => Attribute.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'variation_id': variationId,
        'variation_name': variationName,
        'attributes': attributes?.map((e) => e.toJson()).toList(),
      };
}

class Attribute {
  final int? attributeId;
  final String? attributeName;
  final String? attributeHex;

  Attribute({
    this.attributeId,
    this.attributeName,
    this.attributeHex,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      attributeId: json['attribute_id'],
      attributeName: json['attribute_name'],
      attributeHex: json['attribute_hex'],
    );
  }

  Map<String, dynamic> toJson() => {
        'attribute_id': attributeId,
        'attribute_name': attributeName,
        'attribute_hex': attributeHex,
      };
}

class AttributeGrouped {
  final int? attributeId;
  final String? attributeName;
  final int? id;
  final String? name;
  final String? hex;

  AttributeGrouped({
    this.attributeId,
    this.attributeName,
    this.id,
    this.name,
    this.hex,
  });

  factory AttributeGrouped.fromJson(Map<String, dynamic> json) {
    return AttributeGrouped(
      attributeId: json['attribute_id'],
      attributeName: json['attribute_name'],
      id: json['id'],
      name: json['name'],
      hex: json['hex'],
    );
  }

  Map<String, dynamic> toJson() => {
        'attribute_id': attributeId,
        'attribute_name': attributeName,
        'id': id,
        'name': name,
        'hex': hex,
      };
}
