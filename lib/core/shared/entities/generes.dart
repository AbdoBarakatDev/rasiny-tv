import 'package:equatable/equatable.dart';

class Generes extends Equatable {
  final int id;
  final String name;

  const Generes({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
