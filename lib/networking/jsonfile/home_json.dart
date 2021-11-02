class HomeJson {
  HomeJson({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final Data data;
  late final String message;

  HomeJson.fromJson(Map<String, dynamic> json){
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
    required this.registerOfferOn,
    required this.products,
  });
  late final int registerOfferOn;
  late final List<Products> products;

  Data.fromJson(Map<String, dynamic> json){
    registerOfferOn = json['register_offer_on'];
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['register_offer_on'] = registerOfferOn;
    _data['products'] = products.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
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
  late final List<Images>? images;

  Products.fromJson(Map<String, dynamic> json){
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
    _data['images'] = images!.map((e)=>e.toJson()).toList();
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