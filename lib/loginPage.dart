import 'dart:math';

import 'package:flutter/material.dart';
import 'database.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:firebase_database/firebase_database.dart";
import 'homepage.dart';
import 'package:weddinghall/shared_preferenc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Register.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  bool? loginsuccess;

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  String Fail = '';
  String email = '';

  signInUsingEmailPassword(
    context, {
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        print('----------${value.user!.email}');
        user = value.user;
      });
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalide Email or Password'),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('----------${e.credential}');
      if (e.credential == null) {
        print('No user found for that email.');
        Fail = "User not found";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(Fail),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      } else if (e.credential == password) {
        print('Wrong password provided.');
        Fail = "Wrong password";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(Fail),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(Fail),
      //     backgroundColor: Theme.of(context).errorColor,
      //   ),
      // );
    }

    return user;
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          key: _scaffoldKey,
          body: Builder(
              builder: (context) => Center(
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                                child: Image.asset(
                              "assets/images/logo.png",
                              height: 100,
                              width: 120,
                            )),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      hintText: "Enter your email",
                                      label: Text("Username"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your username';
                                    }
                                    return null;
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                  controller: passController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: Icon(Icons.visibility),
                                      hintText: "Password",
                                      label: Text("Password"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Your username';
                                    }
                                    return null;
                                  }),
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
                                onPressed: () async {
                                  Preferences.addData('login', 'success');
                                  Preferences.addData(
                                      'email', emailController.text);
                                  Preferences.addData(
                                      'password', passController.text);

                                  User? user = await signInUsingEmailPassword(
                                    context,
                                    email: emailController.text,
                                    password: passController.text,
                                  );
                                  print(user);
                                  user == null
                                      ? null
                                      : Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) => home()),
                                        );
                                },
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontSize: 20),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()));
                                    },
                                    child: Text(
                                      "Sign Up ",
                                      style: TextStyle(
                                          color: Colors.pinkAccent,
                                          fontSize: 20),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
