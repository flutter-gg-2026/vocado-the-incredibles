import 'package:equatable/equatable.dart';

class AddMembersEntity extends Equatable {
  final String id;
  final String name;
  final String email;

  const AddMembersEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}