import 'dart:convert';

class AddressGetModel {
  int? id;
  String? name;
  String? addressLine;
  String? zipCode;
  String? city;
  String? state;

  AddressGetModel(
      {this.id,
      this.name,
      this.addressLine,
      this.zipCode,
      this.city,
      this.state});

  AddressGetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    addressLine = json['address_line'];
    zipCode = json['zip_code'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address_line'] = this.addressLine;
    data['zip_code'] = this.zipCode;
    data['city'] = this.city;
    data['state'] = this.state;
    return data;
  }

  static Map<String, dynamic> toMap(AddressGetModel model) {
    return {
      'id': model.id,
      'name': model.name,
      'zip_code': model.zipCode,
      'city': model.city,
      'state': model.state,
      'address_line': model.addressLine,
    };
  }

  static String encode(List<AddressGetModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>(
                (element) => AddressGetModel.toMap(element))
            .toList(),
      );

  static List<AddressGetModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<AddressGetModel>((item) => AddressGetModel.fromJson(item))
          .toList();
}
