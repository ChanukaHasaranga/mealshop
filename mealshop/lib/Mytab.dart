import 'package:flutter/material.dart';

class mytabs extends StatelessWidget {

String text;

   mytabs({
    
    required this.text,
    super.key
    
    
    });

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(text,style:const TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold) ,),
      
    );






  }
}