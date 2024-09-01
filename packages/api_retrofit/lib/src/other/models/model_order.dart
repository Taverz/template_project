class Order {
  final int? id;
  final int productId;
  final int quantity;

  Order({this.id, required this.productId, required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'quantity': quantity,
    };
  }

  static Order fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      productId: map['product_id'],
      quantity: map['quantity'],
    );
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productId == productId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ productId.hashCode ^ quantity.hashCode;
}
