class ProductGroup {
  final int? id;
  final String name;

  ProductGroup({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static ProductGroup fromMap(Map<String, dynamic> map) {
    return ProductGroup(
      id: map['id'],
      name: map['name'],
    );
  }

  @override
  bool operator ==(covariant ProductGroup other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
