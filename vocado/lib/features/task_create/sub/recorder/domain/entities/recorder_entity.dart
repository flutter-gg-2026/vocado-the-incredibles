import 'dart:io';

import 'package:equatable/equatable.dart';

class RecorderEntity extends Equatable {
  final String name;
  final String extension;
  final File path;

  const RecorderEntity({
    required this.name,
    required this.extension,
    required this.path,
  });

  @override
  List<Object?> get props => [name, extension, path];
}
