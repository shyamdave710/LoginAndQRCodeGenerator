import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/widgets/custom_scaffold.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child:
      Center(child: Text("Shyam Dave",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50,color: Colors.white),)),
    );
  }
}
