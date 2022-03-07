
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Signup_Page.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  var user = TextEditingController();
  var pass = TextEditingController();
  var email = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, States>(
      listener: (BuildContext context, state) {},
      builder: (context, state) => Scaffold(
        body: Container(
          color: Color(0XFFA2EEEB),
          child: SafeArea(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color(0XFFA2EEEB)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo.png',
                                height: 100, width: 150),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 100,
                              width: 3,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              "assets/images/Orange_logo.png",
                              width: 80,
                              height: 100,
                            ),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 50, right: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: user,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "please enter your user name";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Enter UserName",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    suffixIcon: Icon(Icons.person),
                                  ),
                                  //to specific the type of input
                                  keyboardType: TextInputType.name,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: email,
                                  validator: (value) {
                                    RegExp emailValid =
                                        RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                    if (value!.isEmpty) {
                                      return "please enter your email";
                                    } else if (!emailValid.hasMatch(value)) {
                                      return "please enter your email in correct format";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Enter Email",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    suffixIcon: Icon(Icons.email),
                                  ),
                                  //to specific the type of input
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 15,
                                ),

                                // TextField(),
                                TextFormField(
                                  controller: pass,
                                  validator: (value) {
                                    if (value!.isEmpty || value == " ") {
                                      return "please enter your password";
                                    } else if (value.isNotEmpty &&
                                        value.length < 8) {
                                      return "Weak Password, enter at least 8 characters";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    suffixIcon: Icon(Icons.lock),
                                  ),
                                  //to convert text into stars(hide)
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 25,
                                ),

                                MaterialButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      print(user.text);
                                      print(pass.text);
                                      print(email.text);
                                    }
                                    ;
                                  },
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  color: Color(0XFFA2EEEB),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  height: 15,
                                ),

                                Text(
                                  "Have an account ?",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Go Login",
                                      style:
                                          TextStyle(color: Color(0XFF27B46E))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
