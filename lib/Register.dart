import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController passController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  String email = '';
  late bool _success;

  userlogin() async {
    User? user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    )).user;
    email = user!.email!;
    print(user.email);
    print(user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (_auth.currentUser == null) {
                _auth.signOut();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('No one has signed in.'),
                ));
              }
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: Text("Register Form "),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter your email",
                    label: Text("Username"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    hintText: "Enter your password",
                    label: Text("Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.pink, Colors.deepOrange],
                    )),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      userlogin();
                    });
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Text(email)
            ],
          ),
        ),
      ),
    );
  }
}
