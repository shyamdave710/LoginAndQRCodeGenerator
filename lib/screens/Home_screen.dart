import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/generate_qr_code.dart';
import 'package:login/screens/scan_qr_code.dart';
import 'package:login/widgets/custom_scaffold.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Color color=Colors.white;
  Widget build(BuildContext context) {
    return CustomScaffold(
      child:Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (e)=> ScanQR()));
                });
              }, child: Text("Scan QR code"),style: ElevatedButton.styleFrom(backgroundColor: Colors.white) ,),
              SizedBox( height: 40,),
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (e)=> GenerateQR()));
                });
                }, child: Text("Generate QR code"),style: ElevatedButton.styleFrom(backgroundColor: Colors.white) ,),
            ],
          ),
      ),
    );
  }
}
