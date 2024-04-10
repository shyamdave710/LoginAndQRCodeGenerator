import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/signin_screen.dart';

import '../components/UiComponents.dart';
import '../widgets/custom_scaffold.dart';
import 'Home_screen.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {

  signup(String email,String password) async{
    if(email=="" && password=="")
      {
          UiHelper.customAlert(context, "Enter required fields");
      }
    else{
      UserCredential? usercredential;
      try{
        usercredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          emailcontroller.text="";
          passwordcontroller.text="";
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (e)=>signinscreen()));
        });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.customAlert(context, ex.code.toString());
      }
    }
  }
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

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
              child:  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                    ),
                    Text(
                      "Let's Get Started..",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.lightBlue,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                    ),
                    UiHelper.CustomTextField(emailcontroller, "Email", false, Icons.mail),
                    UiHelper.CustomTextField(passwordcontroller, "Password", true, Icons.password),
                    SizedBox(height: 30,),
                    UiHelper.CustomButton(() {
                      signup(emailcontroller.text.toString(), passwordcontroller.text.toString());
                    }, "Sign Up"),
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
