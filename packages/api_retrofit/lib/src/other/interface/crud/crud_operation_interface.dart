import 'package:api_client/models/models.dart';

import 'crud_operation.dart';

abstract class GroupCRUDOperation
    implements
        CRUDoperationDBProductGroup,
        CRUDoperationDBProduct,
        CRUDoperationDBOrder {
  @override
  Future<int> createGroup(ProductGroup item) {
    throw UnimplementedError();
  }

  @override
  Future<int> createOrder(Order item) {
    throw UnimplementedError();
  }

  @override
  Future<int> createProduct(Product item) {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteGroup(int id) {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteOrder(int id) {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteProduct(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductGroup>> readAllGroup() {
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> readAllOrder() {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> readAllProduct() {
    throw UnimplementedError();
  }

  @override
  Future<int> updateGroup(ProductGroup item) {
    throw UnimplementedError();
  }

  @override
  Future<int> updateOrder(Order item) {
    throw UnimplementedError();
  }

  @override
  Future<int> updateProduct(Product item) {
    throw UnimplementedError();
  }
}
