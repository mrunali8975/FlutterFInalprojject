import 'package:flutter/material.dart';
import 'database.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:firebase_database/firebase_database.dart";
import 'homepage.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();

  TextEditingController passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
          body: (Center(
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
                          controller: usernameController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Enter your username",
                              label: Text("Username"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
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
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.visibility),
                              hintText: "Password",
                              label: Text("Password"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your username';
                            }
                            return null;
                          }),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget your password?",
                          style: TextStyle(color: Colors.black),
                        )),
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
                          Navigator.push(
                              context, MaterialPageRoute(
                            builder: (context) => home(),));
                          MyDataBase.insertData(
                              usernameController.text, passController.text);
                        },
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: new Container(
                              margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(
                                thickness: 2,
                                color: Colors.black,
                                height: 10,
                              )),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: new Container(
                              margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Divider(
                                thickness: 2,
                                color: Colors.black,
                                height: 10,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.pinkAccent,
                          child: Image.asset(
                            "assets/images/fb3.jpeg",
                            height: 60,
                          ),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.pinkAccent,
                          child: Image.asset(
                            "assets/images/fb2.jpeg",
                            height: 60,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Don't have an account?",
                          style: TextStyle(fontSize: 20),),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up ",
                              style:
                              TextStyle(color: Colors.pinkAccent, fontSize: 20),
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
