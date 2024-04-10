import 'package:flutter/material.dart';
import 'package:login/screens/signin_screen.dart';
import 'package:login/screens/signup_screen.dart';

class welcomebutton extends StatelessWidget {
  const welcomebutton({super.key,this.buttontext, this.onTap, this.color, this.fontcolor});

  final String? buttontext;
  final Widget? onTap;
  final Color? color;
  final Color? fontcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (e)=> onTap!));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration:  BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),)
        ),
        child: Text(
          buttontext!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: fontcolor!),
        ),
      ),
    );
  }
}
