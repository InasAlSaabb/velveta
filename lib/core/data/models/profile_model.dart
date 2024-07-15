class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? phone;
  String? state;
  String? city;
  String? zipCode;
  int? isSub;

  ProfileModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.countryCode,
      this.phone,
      this.state,
      this.city,
      this.zipCode,
      this.isSub});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    isSub = json['is_sub'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['is_sub'] = this.isSub;
    return data;
  }
}
