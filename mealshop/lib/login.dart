

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealshop/firstpage.dart';
import 'package:mealshop/acountcreate.dart';

class login extends StatefulWidget {



   const login(
    
 
    
    {super.key});




  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
        bool reenterpasswordvisible=true;

   
    final reemail=TextEditingController();

    final repassword=TextEditingController();
     Color colorsforbox=Colors.white;
     String txt='';
      var name='';
String usename1='';


     Future Signin() async {

try {

  await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: reemail.text.trim(), 
  
  
  password: repassword.text.trim()
  
  
  
  
  );
setState(() {
  

colorsforbox=Colors.white;
Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  
return const FirstPage();


},));


});
  
} catch (e) {
  
setState(() {
  
colorsforbox=Colors.red;

txt="Inavalid email or Password. Try Again!!";


});



}



}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: const Color.fromARGB(255, 29, 29, 29),

body: Center(
  child:   SingleChildScrollView(
  
  
  
    child: Column(
  
  
  
  children: [

    Padding(
               padding: const EdgeInsets.only(bottom: 100),
               child: ClipRRect(
                    
                 borderRadius: BorderRadius.circular(30),
                
             child:Image.asset("assetss/xcopy.png",height: 100,),
             
                         
             
               ),
             ),

  
  
  
  Padding(
    padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
    child: Container(
      child: TextField(
      
      
      
      controller: reemail,
      
      decoration: InputDecoration(
      
      hintText: "Email",
      
      hintStyle: TextStyle(color: Colors.grey.shade300),
      
      prefixIcon: const Icon(Icons.email,color: Colors.white,),
      
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide:  const BorderSide(color:Colors.amber)),
      
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide:BorderSide(color:colorsforbox)),
      
      
      
      
      
      
      
      
      
      
      
      
      
      ),
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      ),
    ),
  ),
  Text(txt,style: TextStyle(color: colorsforbox),),
  Padding(
    padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
    child: TextField(
    
    
    
    controller: repassword,
    obscureText: reenterpasswordvisible,
    
    decoration: InputDecoration(
      
    
    hintText: "Password",
    
    hintStyle: TextStyle(color: Colors.grey.shade300),
    
    prefixIcon: const Icon(Icons.lock,color: Colors.white,),
    
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide:  const BorderSide(color:Colors.amber)),
    
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide:BorderSide(color:colorsforbox)),
    
    suffixIcon:IconButton(icon: Icon(reenterpasswordvisible ? Icons.visibility_off:Icons.visibility), onPressed: () { 
setState(() {
  
reenterpasswordvisible=!reenterpasswordvisible;


});




     },)
    
    
    
    
    
    
    
    
    
    
    
    
    ),
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ),
  ),
 
  Text(txt,style: TextStyle(color: colorsforbox),),






  Padding(
    padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
    child: ElevatedButton(
  onPressed: () { 

Signin();


   },
  style:ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 255, 127, 7),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                              fixedSize: const Size(370, 55),
  
  
  
  
  
  
  
  ),
  
  child: const Text("SignIn",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
  
  
    ),
  ),
  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("I'm Not a Member!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                      InkWell(
                        
                        onTap: () {
                          
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) {

                              
                               
return const acountcreate();


                             },));


                        },
                        
                                                    child: const Text(" Register now",style: TextStyle(color: Colors.blue),)
                        
                        
                        )
                    ],
                  ),

  
  
  
  
  
  
  
  
  
  
  
  
  
  ],
  
  
  
  
  
  
  
  
  
  
  
    ),
  
  
  
  
  
  
  
  ),
),

    );





  }




}