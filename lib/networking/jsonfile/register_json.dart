class RegisterJson {
  RegisterJson({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String message;

  RegisterJson.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.accessToken,
    required this.user,
  });
  late final String accessToken;
  late final User user;

  Data.fromJson(Map<String, dynamic> json){
    accessToken = json['access_token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.vip,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String name;
  late final String email;
  late final String phone;
  late final int vip;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    vip = json['vip'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['vip'] = vip;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}