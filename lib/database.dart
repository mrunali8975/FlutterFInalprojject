import 'package:firebase_database/firebase_database.dart';
class MyDataBase {
  static List<Map> data = [];
  static DatabaseReference db = FirebaseDatabase.instance.ref('students');
  static DatabaseReference hdb = FirebaseDatabase.instance.ref('halldata');

  static Future insertData(String email, String pass) async {
    String key = db.push().key!;

    db.child(key).set({
      'username': email,
      'password': pass,
      'key': key,
    }).then((value) {
      selectData();
    });
  }

  static Future updateDate(String email, String pass, String key) async {
    db.child(key).update({
      'email': email,
      'pass': pass,
      'key': key,
    }).then((value) {
      selectData();
    });
  }

  static deleteData(String key) {
    db.child(key).remove();
  }

  static Future selectData() async {

    Map temp = {};
    hdb.once().then((value) {
      temp = value.snapshot.value as Map;
      data.clear();
      temp.forEach((key, value) {
        data.add(value);
      }

      );
      print(data);
    });
  }
}
