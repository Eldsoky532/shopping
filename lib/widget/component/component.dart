import 'package:flutter/material.dart';

Widget defaultbutton(String text, Function() onpressed)
{
  return Center(
    child: Container(
      width: 360,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.orange,
      ),
      child: TextButton(
          onPressed: onpressed,
          child: Text(
            "$text",
            style: TextStyle(fontSize: 15, color: Colors.white),
          )),
    ),
  );
}


Widget defaultTextField(String text,String hint,Icon icon,TextEditingController controller,Function validate){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
        child: Text(
          "$text",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
        child: TextFormField(
          controller: controller,
          validator: (value){
            return validate(value);
          },
          decoration: InputDecoration(
              hintText: '$hint',
              suffixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIconColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ),
      )
    ],
  );
}




