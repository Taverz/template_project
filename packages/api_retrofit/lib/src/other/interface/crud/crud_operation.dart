import '../../models/models.dart';

abstract class CRUDoperationDBProductGroup {
  Future<int> createGroup(ProductGroup item);

  Future<List<ProductGroup>> readAllGroup();

  Future<int> updateGroup(ProductGroup item);

  Future<int> deleteGroup(int id);
}

abstract class CRUDoperationDBProduct {
  Future<int> createProduct(Product item);

  Future<List<Product>> readAllProduct();

  Future<int> updateProduct(Product item);

  Future<int> deleteProduct(int id);
}

abstract class CRUDoperationDBOrder {
  Future<int> createOrder(Order item);

  Future<List<Order>> readAllOrder();

  Future<int> updateOrder(Order item);

  Future<int> deleteOrder(int id);
}
