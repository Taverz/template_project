import '../orm/models/table.dart';

class UserMapper {
  User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap(User user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
    };
  }
}
