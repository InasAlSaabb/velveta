class AddressModel {
  int? userId;
  String? name;
  String? addressLine;
  String? state;
  String? city;
  String? zipCode;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddressModel(
      {this.userId,
      this.name,
      this.addressLine,
      this.state,
      this.city,
      this.zipCode,
      this.updatedAt,
      this.createdAt,
      this.id});

  AddressModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    addressLine = json['address_line'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address_line'] = this.addressLine;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
