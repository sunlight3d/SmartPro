class User {
  final String lastName;
  final int id;
  final String email;
  final DateTime dateOfBirth;
  final String job;
  final String city;
  final String zipcode;
  final double latitude;
  final String gender;
  final String firstName;
  final String phone;
  final String street;
  final String state;
  final String country;
  final double longitude;

  User({
    required this.lastName,
    required this.id,
    required this.email,
    required this.dateOfBirth,
    required this.job,
    required this.city,
    required this.zipcode,
    required this.latitude,
    required this.gender,
    required this.firstName,
    required this.phone,
    required this.street,
    required this.state,
    required this.country,
    required this.longitude,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      lastName: json['last_name'] ?? "",
      id: json['id'] ?? 0,
      email: json['email'] ?? "",
      dateOfBirth: DateTime.parse(json['date_of_birth'] ?? ""),
      job: json['job'] ?? "",
      city: json['city'] ?? "",
      zipcode: json['zipcode'] ?? "",
      latitude: json['latitude'] ?? 0.0,
      gender: json['gender'] ?? "",
      firstName: json['first_name'] ?? "",
      phone: json['phone'] ?? "",
      street: json['street'] ?? "",
      state: json['state'] ?? "",
      country: json['country'] ?? "",
      longitude: json['longitude'] ?? 0.0,
    );
  }

}
