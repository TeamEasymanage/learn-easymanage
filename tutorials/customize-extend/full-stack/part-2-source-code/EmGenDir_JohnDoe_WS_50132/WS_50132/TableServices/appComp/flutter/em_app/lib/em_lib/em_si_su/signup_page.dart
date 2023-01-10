import 'package:em_app/em_lib/hivedb/models/emuser.dart';
import 'package:em_app/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();

  String emUserName = "";
  String emMobile = "";
  String emEmail = "";
  String emUserId = "";
  String emPassword = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.25,
                child: SingleChildScrollView(
                  child: Form(
                      key: formkey,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                emUserName = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'UserName',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Some Text";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                emPassword = value;
                              });
                            },
                            obscureText: true,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Password',
                            ),
                            validator: (value) {
                              if (value!.length < 4) {
                                return "Enter 4 character password";
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                confirmPassword = value;
                              });
                            },
                            obscureText: true,
                            autocorrect: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                            ),
                            validator: (value) {
                              if (value!.length < 4) {
                                return "Enter 4 character password";
                              } else if (value != emPassword) {
                                return "Passwords do not match";
                              }
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (formkey.currentState!.validate()) {
                                    //The form is valid
                                    //Lets save the user in Hive database.

                                    String msg = "Error : -";

                                    try {
                                      saveNewUser();
                                      msg = "User Created Successfully";
                                    } catch (e) {
                                      msg = msg + e.toString();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(msg)),
                                      );
                                    }

                                    if (msg == "User Created Successfully") {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute( 
                                      builder: (context) =>  const MyHomePage(),
                                    ),
                              (Route<dynamic> route) => false
                              );
                              /*

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyHomePage()),
                                      );
                                      */
                                    }
                                  }
                                },
                                child: const Text('SIGN UP'),
                              ),
                            ],
                          ),
                        ),
                      ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveNewUser() async {
    var user = EmUser()
        ..emUserName = emUserName
        ..emMobile = emMobile
        ..emEmail = emMobile
        ..emUserId = emUserName
        ..emPassword = emPassword
        ..emAuthenticated = true;

    var usersBox = await Hive.openBox('users');
    await usersBox.put("userKey", user);
  }
}
