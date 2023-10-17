class User {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final String image;
  final String gender;
  final String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.image,
    required this.gender,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      image: json['image'],
      gender: json['gender'],
      email: json['email'],
    );
  }
}
