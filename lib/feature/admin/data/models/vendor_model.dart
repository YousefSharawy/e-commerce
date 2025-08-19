class VendorModel {
  String name;
  String email;
  String status;
  VendorModel({
    required this.name,
    required this.email,
    required this.status,
  });
  factory VendorModel.fromSupabase(Map<String,dynamic> json){
    return VendorModel(
      name : json['name'] ?? '',
      email : json['email'] ?? '',
      status : json['status'] ?? '',
    );
  }

 Map <String,dynamic> toSupabase() {
    return {
      'name': name,
      'email': email,
      'status': status,
    };
  }
}