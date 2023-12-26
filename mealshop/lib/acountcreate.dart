
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealshop/login.dart';

class acountcreate extends StatefulWidget {
   const acountcreate({super.key});



  @override
  State<acountcreate> createState() => _acountcreateState();
}

class _acountcreateState extends State<acountcreate> {
bool paswordvisible=true;
bool confirmpaswordvisible=true;

final email=TextEditingController();

final password=TextEditingController();

final conformpassword=TextEditingController();

final firstname=TextEditingController();

final lastname=TextEditingController();

Color confirmcolor=Colors.white;
  String confirm='';
  String emailtype='';


Future Singup() async {

if(passwordconfirm()){

  
    
  try {
    
  
 UserCredential userCredential=
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
  email:email.text.trim(), 
  password:password.text.trim()
  
  );



 FirebaseFirestore.instance.collection("users").doc(userCredential.user!.email!).set(

{

'name':firstname.text.trim(),
'email':email.text.trim(),
'lastname':lastname.text.trim()



}


 );


   Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                              
                                 return const login();

                           },));

  }
   on FirebaseAuthException    {
    

showDialog(
  context: context, 
  
  builder:(context) {
   return const AlertDialog(

title:Text("Some Inputs are Wrong! Try again ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),)

    );
  },
  
  );


  }                        

}
}






bool passwordconfirm(){

if(password.text.trim()==conformpassword.text.trim()){

return true;



}else{


return false;

}



}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

              backgroundColor: const Color.fromARGB(255, 29, 29, 29),
body:Center(
  child:   SingleChildScrollView(
  
  
  
  
  
  
  
       scrollDirection: Axis.vertical,
  
  
  
  
  
  
  
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
         children: [

             Padding(
               padding: const EdgeInsets.only(bottom: 100),
               child: ClipRRect(
                    
                 borderRadius: BorderRadius.circular(30),
                
             child:Text("MealApp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 45,fontFamily:"ins"),),

             
                         
             
               ),
             ),



           Center(
  
           
  
             child: Column(
  
              mainAxisAlignment: MainAxisAlignment.start,
  
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                   child: TextField(
                   
                           
                   
                                   
                   
                                keyboardType: TextInputType.text,
                   
                                   
                   
                                controller: firstname,
                   
                                   
                   
                   decoration: InputDecoration(
                   
                                   
                   
                    hintText: "First Name",
                   
                                   
                   
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                   
                                   
                   
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
                   
                                   
                   
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: const BorderSide(color: Colors.white)),
                   
                                   
                   
                      fillColor: Colors.amber,
                   
                                   
                   
                     prefixIcon:const Icon(Icons.person,color: Color.fromARGB(255, 255, 255, 255),)
                   
                                   
                   
                      
                   
                                   
                   
                   ),
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                   ),
                 ),
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
                   child: TextField(
                   
                           
                   
                                   
                   
                                keyboardType: TextInputType.text,
                   
                                   
                   
                                controller: lastname,
                   
                                   
                   
                   decoration: InputDecoration(
                   
                                   
                   
                    hintText: "Last Name",
                   
                                   
                   
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                   
                                   
                   
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
                   
                                   
                   
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: const BorderSide(color: Colors.white)),
                   
                                   
                   
                      fillColor: Colors.amber,
                   
                                   
                   
                     prefixIcon:const Icon(Icons.person,color: Color.fromARGB(255, 255, 255, 255),)
                   
                                   
                   
                      
                   
                                   
                   
                   ),
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                   ),
                 ),
  
                 Padding(
                   padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                   child: TextField(
                   
                           
                   
                                   
                   
                                keyboardType: TextInputType.text,
                   
                                   
                   
                                controller: email,
                   
                                   
                   
                   decoration: InputDecoration(
                   
                                   
                   
                    hintText: "Email",
                   
                                   
                   
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                   
                                   
                   
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
                   
                                   
                   
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide(color:confirmcolor)),
                   
                                   
                   
                      fillColor: Colors.amber,
                   
                                   
                   
                     prefixIcon:const Icon(Icons.person,color: Color.fromARGB(255, 255, 255, 255),)
                   
                                   
                   
                      
                   
                                   
                   
                   ),
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                      
                   
                                   
                   
                   ),
                 ),

  
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30, 20, 30, 2),
                    child: TextField(
                    
                           
                    
                                   
                    
                                keyboardType: TextInputType.text,
                  
                                   obscureText:paswordvisible ,
                    
                                controller: password,
                    
                                   
                    
                                   decoration: InputDecoration(
                    
                                   
                  
                    hintText: "Password",
                    
                                   
                    
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    
                                   
                    
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
                    
                                   
                    
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide(color:confirmcolor)),
                    
                                   
                    
                      fillColor: Colors.amber,
                    
                                   
                    
                     prefixIcon:const Icon(Icons.lock,color: Color.fromARGB(255, 255, 255, 255),),
                    
                          suffixIcon: IconButton(icon: Icon(paswordvisible ? Icons.visibility_off : Icons.visibility,color: Colors.white,), onPressed: () { 
setState(() {
  
                              paswordvisible=!paswordvisible;



});


                           },)         
                    
                      
                    
                                   
                    
                                   ),
                    
                                   
                    
                      
                    
                                   
                    
                      
                    
                                   
                    
                      
                    
                                   
                    
                      
                    
                                   
                    
                      
                    
                                   
                    
                                   ),
                                   
                  ),
                                     Text(confirm,style: TextStyle(color:confirmcolor),),

                 
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30, 12, 30, 2),
                    child: TextField(
                          
                    keyboardType: TextInputType.text,
                    controller: conformpassword,
                  obscureText: confirmpaswordvisible,
                    decoration: InputDecoration(
                       hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                  
                     
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
                      
                                     
                      
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: BorderSide(color:confirmcolor)),
                      
                                     
                      
                        fillColor: Colors.amber,
                      
                                     
                      
                       prefixIcon:const Icon(Icons.lock,color: Color.fromARGB(255, 255, 255, 255),),
                      
                  suffixIcon: IconButton(icon: Icon(confirmpaswordvisible ? Icons.visibility_off:Icons.visibility), 
                  onPressed: () { 

                            setState(() {
                              
                               confirmpaswordvisible=!confirmpaswordvisible;

                            });


                   },)
                    ),
                  
                  
                  
                    ),
                  ),

                   Text(confirm,style: TextStyle(color:confirmcolor),),
                 
                  Padding(
                   padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                    child: ElevatedButton(
                      
                      onPressed: () { 

confirmpart(conformpassword.text,password.text);

                           Singup();
                        


                       },
                  
                        style:ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 255, 127, 7),
                            fixedSize: const Size(370, 55),
                              shape:RoundedRectangleBorder(
                  
                         borderRadius: BorderRadius.circular(13),
                  
                              ),
                            
                               shadowColor: Colors.black
                  
                        ),
                  
                        child:const Center(child: Text("Sing Up",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
                        
                  
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("I'm a Member!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                      InkWell(
                        
                        onTap: () {
                          
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                               
                                        return const login();

                                            

                             },));


                        },
                        
                                                    child: const Text(" Login",style: TextStyle(color: Colors.blue),)
                        
                        
                        )
                    ],
                  )
  
               ],
  
             ),
  
           
  
           ),
         ],
       ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     ),
),

    );
  }
void confirmpart(String comps,String psw){
setState(() {
  
if(comps==psw){

confirm="Password match";
confirmcolor=Colors.blue;




}else{

confirm="Password does not match";
confirmcolor=Colors.red;


}






});





}






}
