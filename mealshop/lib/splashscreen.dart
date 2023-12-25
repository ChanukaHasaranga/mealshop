import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mealshop/login.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

void initState(){

super.initState();

Timer(const Duration(seconds: 6), () { 

Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  return login();
},));



});






}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Center(
    
         child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
        


            
    
Padding(
  padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 70),
  child:   Image.network("https://media1.giphy.com/media/yrwI9we7VX07iM6aW1/giphy.gif?cid=ecf05e47gzvlcujt0i24lkdw9cim9of7wigo9r625apeqdi7&ep=v1_stickers_search&rid=giphy.gif&ct=s"),
),    
    
                    Text("Welcome to",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,fontFamily:"ins"),),
                    SizedBox(height: 8,),

                Text("MealApp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 45,fontFamily:"ins"),),

          ],
    
    
            
    
    
    
    
    
    
    
    
    
    
    
         ),
    
    
    
    
    
    
    
    
    
    
    
        ),
    
    
    
    
    
    
    );






  }
}