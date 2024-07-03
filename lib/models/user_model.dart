class UserModel {
  int? id;
  String? name;
  String? username;
  String? emailVerifiedAt;
  String? password;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  int? age;
  int? outletId;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.age,
      this.outletId});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    age = json['age'];
    outletId = json['outlet_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['age'] = age;
    data['outlet_id'] = outletId;
    return data;
  }
}