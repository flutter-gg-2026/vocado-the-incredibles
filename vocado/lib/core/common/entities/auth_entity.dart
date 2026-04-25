import 'package:equatable/equatable.dart';

enum UserRole {
  admin,
  user,
}

class AuthEntity extends Equatable {
  final String id;
  final String? name;
  final String email;
  final UserRole role;

  const AuthEntity({
  required this.id,
  required this.name,
  required this.email,
  required this.role,
});

  @override
  List<Object?> get props => [role, email, name, id];
}
