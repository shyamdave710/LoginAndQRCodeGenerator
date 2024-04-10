import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/components/UiComponents.dart';
import 'package:login/screens/Home_screen.dart';
import 'package:login/screens/signup_screen.dart';

import '../widgets/custom_scaffold.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({super.key});

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {

  login(String email,String password) async{
    if(email=="" && password=="")
    {
      UiHelper.customAlert(context, "Enter required fields");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (e)=>homescreen()));
        });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.customAlert(context, ex.code.toString());
      }
    }
  }
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox(
              height: 5,
            ),
          ),
          Expanded(
            flex: 7,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255,  255 ,   255 , 0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 40,
                      ),
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Colors.lightBlue,
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 40,
                      ),
                      UiHelper.CustomTextField(
                          emailcontroller, "Email", false, Icons.mail),
                      UiHelper.CustomTextField(
                          passwordcontroller, "Password", true, Icons.password),
                      UiHelper.CustomButton(() {
                        login(emailcontroller.text.toString(), passwordcontroller.text.toString());
                      }, "Sign In"),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have an account ??",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (e)=>signupscreen()));
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
