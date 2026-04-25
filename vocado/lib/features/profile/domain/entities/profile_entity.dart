import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String? name;
  final String email;
  final String role;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });


  @override
  List<Object?> get props => [id, name, email, role];
}
