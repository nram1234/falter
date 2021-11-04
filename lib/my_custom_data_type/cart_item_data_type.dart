class CartItemDataType {
  late   int id;

  late   int qt;

  CartItemDataType({required this.id, required this.qt});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'qt': this.qt,
    };
  }

  factory CartItemDataType.fromMap(Map<String, dynamic> map) {
    return CartItemDataType(
      id: map['id'] as int,
      qt: map['qt'] as int,
    );
  }
}
