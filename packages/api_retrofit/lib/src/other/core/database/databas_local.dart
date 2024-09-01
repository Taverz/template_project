import '../../interface/crud/crud_operation_interface.dart';
import '../../mock/fixture_crud_operation_interface.dart';

class DatabBaseLocal {
  static GroupCRUDOperation get currentDataBase => SQLORMFixture();
}
