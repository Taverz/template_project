import 'package:api_client/interface/crud/crud_operation_interface.dart';
import 'package:api_client/models/models.dart';

class SQLORMFixture implements GroupCRUDOperation {
  final List<ProductGroup> _productGroups = [
    ProductGroup(name: "Группа 1"),
    ProductGroup(name: "Группа 2"),
  ];
  final List<Product> _products = [
    Product(name: "Товар 1.2", groupId: 1),
    Product(name: "Товар 2.3", groupId: 1),
    Product(name: "Товар 3.3", groupId: 2),
  ];
  final List<Order> _orders = [
    Order(productId: 1, quantity: 2),
    Order(productId: 2, quantity: 1),
  ];

  @override
  Future<int> createGroup(ProductGroup item) async {
    _productGroups
        .add(ProductGroup(id: _productGroups.length + 1, name: item.name));
    return _productGroups.length;
  }

  @override
  Future<List<ProductGroup>> readAllGroup() async {
    return _productGroups;
  }

  @override
  Future<int> updateGroup(ProductGroup item) async {
    final index = _productGroups.indexWhere((group) => group.id == item.id);
    if (index != -1) {
      _productGroups[index] = item;
      return 1;
    }
    return 0;
  }

  @override
  Future<int> deleteGroup(int id) async {
    _productGroups.removeWhere((group) => group.id == id);
    return 1;
  }

  @override
  Future<int> createProduct(Product item) async {
    _products.add(Product(
        id: _products.length + 1, name: item.name, groupId: item.groupId));
    return _products.length;
  }

  @override
  Future<List<Product>> readAllProduct() async {
    return _products;
  }

  @override
  Future<int> updateProduct(Product item) async {
    final index = _products.indexWhere((product) => product.id == item.id);
    if (index != -1) {
      _products[index] = item;
      return 1;
    }
    return 0;
  }

  @override
  Future<int> deleteProduct(int id) async {
    _products.removeWhere((product) => product.id == id);
    return 1;
  }

  @override
  Future<int> createOrder(Order item) async {
    _orders.add(Order(
        id: _orders.length + 1,
        productId: item.productId,
        quantity: item.quantity));
    return _orders.length;
  }

  @override
  Future<List<Order>> readAllOrder() async {
    return _orders;
  }

  @override
  Future<int> updateOrder(Order item) async {
    final index = _orders.indexWhere((order) => order.id == item.id);
    if (index != -1) {
      _orders[index] = item;
      return 1;
    }
    return 0;
  }

  @override
  Future<int> deleteOrder(int id) async {
    _orders.removeWhere((order) => order.id == id);
    return 1;
  }
}
