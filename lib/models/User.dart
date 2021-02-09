class User {
  String name;
  String email;
  String image;
  int id, role, status;

  User(
    int id,
    int role,
    int status,
    String name,
    String email,
    String image,
  ) {
    this.id = id;
    this.name = name;
    this.role = role;
    this.email = email;
    this.image = image;
    this.status = status;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        email = json['email'],
        role = json['role_id'],
        status = json['is_active'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'email': email,
      'image': image,
      'status': status
    };
  }
}
