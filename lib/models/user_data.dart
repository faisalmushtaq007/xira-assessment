import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  String uid;
  String email;
  String? dob;

  UserData({required this.uid, required this.email, this.dob});

  UserData.fromMap(Map<String, dynamic> map)
      : email = map["email"] ?? "",
        uid = map["uid"] ?? "", dob = map['dob'];

  Map<String, dynamic> toMap() {
    return {"email": email, "uid": uid, "dob": dob};
  }
}
