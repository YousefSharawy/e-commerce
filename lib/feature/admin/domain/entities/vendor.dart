import 'package:equatable/equatable.dart';

class Vendor extends Equatable {
  String name;
  String email;
  String status;
  Vendor({
    required this.name,
    required this.email,
    required this.status,
  });
  @override
  List<Object?> get props => [email];
}