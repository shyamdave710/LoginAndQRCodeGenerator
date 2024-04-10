import 'package:flutter/material.dart';
import 'package:login/widgets/custom_scaffold.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController urlController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (urlController.text.isNotEmpty)
                  QrImageView(
                    data: urlController.text,
                    size: 200,
                    backgroundColor: Colors.white,
                  ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    controller: urlController,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      filled: true,
                      focusColor: Colors.white,
                      fillColor: Colors.white70,
                      hintText: "Enter Your Data",
                      hintStyle: const TextStyle(color: Colors.deepPurple),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50),),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: const Text("Generate QR Code")),
              ],
            ),
          ),
        ),
    );
  }
}
