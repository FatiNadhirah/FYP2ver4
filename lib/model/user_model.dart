class UserModel {
  String? uid;
  String? email;
  String? username;
  String? faculty;
  // String? department;
  String? year;

  UserModel({this.uid, this.email, this.username, this.faculty, this.year});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
      faculty: map['faculty'],
      // department: map['department'],
      year: map['year'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'faculty': faculty,
      // 'department': department,
      'year': year,
    };
  }
}
