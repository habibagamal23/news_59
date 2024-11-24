class RegisterRequestBody {
  String email;
  String password;
  String name;
  String phoneNumber;
  String? imgUrl; // Made nullable to handle optional profile image URLs

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
    this.imgUrl, // Optional in the constructor
  });

  /// Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone_number': phoneNumber,
      'img_url': imgUrl, // Include the imgUrl in the JSON
    };
  }

  /// Create an object from a JSON map
  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) {
    return RegisterRequestBody(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      imgUrl: json['img_url'], // Handle null for optional field
    );
  }
}
