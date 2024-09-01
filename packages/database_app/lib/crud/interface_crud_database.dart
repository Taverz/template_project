abstract class ICrudDataBase<T> {
  Future<void> insert(T item);
  Future<void> update(T item);
  Future<void> delete(T item);
  Future<T?> getById(int id);
  Future<List<T>> getAll();
}
