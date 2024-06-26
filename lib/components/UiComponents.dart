import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{

  static CustomTextField(TextEditingController controller, String text,bool toHide,IconData icon){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(icon),
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  static CustomButton(VoidCallback voidCallback,String text)
  {
    return SizedBox(height: 50,width: 200,child:
      ElevatedButton(onPressed: (){
        voidCallback();
      },style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          ), backgroundColor: Colors.blue),
          child: Text(text,style: TextStyle(color: Colors.white,fontSize: 18),)),);
  }

  static customAlert(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))
        ],
      );
    });
  }
}