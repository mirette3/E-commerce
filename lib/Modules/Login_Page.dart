
import 'package:amit_and_orange_shop_app/Layout/Cubit/cubit.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/mainpage.dart';
import 'package:amit_and_orange_shop_app/Layout/Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Signup_Page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var user = TextEditingController();
  var pass = TextEditingController();
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
                      child: TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 500),
                        tween: Tween(begin: 0.0, end: 1),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(value * 50 - 50, 0),
                            child: child,
                          );
                        },
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
                          child: Column(
                            children: [
                              TextFormField(
                                controller: user,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter your username";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Enter UserName",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                //to specific the type of input
                                keyboardType: TextInputType.name,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // TextField(),
                              TextFormField(
                                controller: pass,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter your password";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  suffixIcon: IconButton(
                                    icon: Icon(MyCubit.get(context).show_icon
                                        ? Icons.visibility_rounded
                                        : Icons.visibility_off_rounded),
                                    onPressed: () {
                                      MyCubit.get(context).changeButton();
                                    },
                                  ),
                                ),

                                // suffixIcon: MyCubit.get(context).show_icon?Icon(Icons.remove_red_eye):Icon(Icons.remove_red_eye_outlined)),
                                // //to convert text into stars(hide)
                                obscureText: MyCubit.get(context).show_icon
                                    ? false
                                    : true,
                                // onTap: (){MyCubit.get(context).changeButton();},
                              ),

                              SizedBox(
                                height: 25,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()));
                                  }
                                  ;
                                },
                                child: Text(
                                  "LOG IN",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black45,
                                  ),
                                ),
                                color: Color(0XFFA2EEEB),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have account ?",
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupScreen()));
                                    },
                                    child: Text("Sign Up",
                                        style: TextStyle(
                                            color: Color(0XFF27B46E))),
                                  )
                                ],
                              ),
                            ],
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
