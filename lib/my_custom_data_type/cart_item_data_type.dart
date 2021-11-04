class CartItemDataType {
  late   int id;
late double price;
  late   int qt;

  CartItemDataType({required this.id, required this.qt, required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'qt': this.qt,
    };
  }

  factory CartItemDataType.fromMap(Map<String, dynamic> map) {
    return CartItemDataType(
      id: map['id'] as int,
      price: map['price'] as double,
      qt: map['qt'] as int,
    );
  }
}
