class GetProductJson {
  GetProductJson({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;

  GetProductJson.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.desc,
    required this.offer,
    required this.price,
    required this.vip,
    required this.images,
  });
  late final int id;
  late final String name;
  late final String desc;
  late final int offer;
  late final String price;
  late final String vip;
  late final List<Images> images;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    offer = json['offer'];
    price = json['price'];
    vip = json['vip'];
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['desc'] = desc;
    _data['offer'] = offer;
    _data['price'] = price;
    _data['vip'] = vip;
    _data['images'] = images.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.path,
  });
  late final int id;
  late final String path;

  Images.fromJson(Map<String, dynamic> json){
    id = json['id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['path'] = path;
    return _data;
  }
}