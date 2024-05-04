import 'package:flutter/material.dart';
import 'package:project/second_page.dart';
import 'package:project/services/functions/authFunctions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Centering the entire container
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centering the column content
            children: [
              Container(
                child: Text(
                  'Caring made simple',
                  style: TextStyle(
                    color: Color.fromARGB(255, 163, 93, 66),
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'Poppins',
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(14),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ======== Full Name ========
                      login
                          ? Container()
                          : TextFormField(
                              key: ValueKey('fullname'),
                              decoration: InputDecoration(
                                hintText: 'Enter Full Name',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Full Name';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  fullname = value!;
                                });
                              },
                            ),

                      // ======== Email ========
                      TextFormField(
                        key: ValueKey('email'),
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please Enter valid Email';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            email = value!;
                          });
                        },
                      ),

                      // ======== Password ========
                      TextFormField(
                        key: ValueKey('password'),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                        ),
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Please Enter Password of min length 6';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            password = value!;
                          });
                        },
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              login
                                  ? AuthServices.signinUser(
                                      email, password, context)
                                  : AuthServices.signupUser(
                                      email, password, fullname, context);
                            }
                          },style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 163, 93, 66), // Background color
                          ),
                          child: Text(
                            login ? 'LOGIN' : 'SIGNUP',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            login == "SIGNUP"
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SecondPage()),
                                  )
                                : login = !login;
                          });
                        },
                        child: Text(
                          login
                              ? "Don't have an account? Signup"
                              : "Already have an account? Login",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
