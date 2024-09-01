class Product {
  final int? id;
  final String name;
  final int groupId;

  Product({this.id, required this.name, required this.groupId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'group_id': groupId,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      groupId: map['group_id'],
    );
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.groupId == groupId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ groupId.hashCode;
}
