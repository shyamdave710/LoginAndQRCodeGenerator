import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login/screens/signin_screen.dart';
import 'package:login/screens/signup_screen.dart';
import 'package:login/widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';

class welcomescreen extends StatelessWidget {
  const welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      child:  Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 40,
              ),
              child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                       TextSpan(
                         text: 'WithYou!\n',
                         style: TextStyle(
                           fontSize: 45.0,
                           fontWeight: FontWeight.w900,
                         ),),
                        TextSpan(
                          text: '\nUnlocking Convenience: \nYour QR Code Solution\n',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(81, 23, 133, 1.0),
                          ),
                        )
                      ],
                    ),

                  )
              ),
            ),
          ),
          const Flexible(
            flex: 1,
              child:Align(
                alignment: Alignment.bottomRight,
                child: Row(
                children: [
                  Expanded(child:
                  welcomebutton(
                    buttontext: 'SignIn',
                    onTap: signinscreen(),
                    color: Colors.transparent,
                    fontcolor: Colors.white,
                  )),
                  Expanded(child:
                  welcomebutton(
                    buttontext: 'SignUp',
                    onTap: signupscreen(),
                    color: Colors.white,
                    fontcolor: Color.fromRGBO(81, 23, 133, 1.0),
                  )),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
