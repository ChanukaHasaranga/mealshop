
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealshop/login.dart';

class Mydrawer extends StatefulWidget {

   const Mydrawer(
    
    {super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}


class _MydrawerState extends State<Mydrawer> {

  
 
final currentuser=FirebaseAuth.instance.currentUser!;


void signout(){
FirebaseAuth.instance.signOut();
Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  
return const login();


},));

  
}

  @override
  Widget build(BuildContext context) {
    return Drawer(

child: StreamBuilder<DocumentSnapshot>(
    
    stream:FirebaseFirestore.instance.collection("users").doc(currentuser.email!).snapshots(),
    
    builder: (context, snapshot) {
    
    
    
        if(snapshot.hasData){
    
    
    
          final userdataperson=snapshot.data!.data() as Map<String, dynamic>;//error showing
    
    
    
      return ListView(
    
  children: [
    
    const SizedBox(height:20 ,),
    
  
    
     const Icon(Icons.person,size: 87,),
    
  
    
     const SizedBox(height:15,),
    
  
    
     Row(
    
  mainAxisAlignment: MainAxisAlignment.center,
    
  children: [
    
  
    
     const Text("Hi! ",style: TextStyle(fontSize: 18,),),
    
     Text(userdataperson['name'],style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
    
  
    
  
    
  
    
  ],
    
  
    
     ),
    
     const SizedBox(height: 17,),
    
  
    
  
    
  Padding(
    
    padding: const EdgeInsets.all(13.0),
    
    child:   Container(
    
    height: 68,
    
     decoration: BoxDecoration(
    
    
    
    border: Border.all(color:Colors.white),
    
    
    
    borderRadius: BorderRadius.circular(12)
    
    ),
    
     child:   ListTile(
    
      title:const Text("Full Name"),
    
      subtitle: Text(userdataperson['name']+ userdataperson['lastname'],style: const TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
    
      ),
    
    
    
    ),
    
  ),
    
  Padding(
    
    padding: const EdgeInsets.all(13.0),
    
    child:   Container(
    
    height: 68,
    
     decoration: BoxDecoration(
    
    
    
    border: Border.all(color:Colors.white),
    
    
    
    borderRadius: BorderRadius.circular(12)
    
    ),
    
     child:   ListTile(
    
      title:const Text("Email"),
    
      subtitle: Text(FirebaseAuth.instance.currentUser!.email!,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
    
      ),
    
    
    
    ),
    
  ),

  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 62),
    child: ElevatedButton(
      
      onPressed: () {

signout();
        },
  
  style: ElevatedButton.styleFrom(
    fixedSize:const Size.fromHeight(43),
    backgroundColor:const Color.fromARGB(255, 210, 82, 13),
  shape:RoundedRectangleBorder(
  
  
  borderRadius: BorderRadius.circular(12)
   
  )
  
  
  
  
  ),
  
  
  child:const Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  
  
  Icon(Icons.logout),
  
  
  Text("Signout",style: TextStyle(fontSize: 20),),
  
  
  ],
  
  
  ),
  
  
  
    ),
  )

    

    
  
    
  
    
  
    
  
    
  
    
  
    
  ],
    
  
    
  
    
  
    
  
    
      );
    
    }else if(snapshot.hasError){
    
      
    
     return Center(
    
     child: Text("Error${snapshot.error}"),
    
    
    
    
    
     );
    
      
    
    }
    
    return const Center(
    
        child: CircularProgressIndicator()
    
    
    
    );
    
    }
    
  ),

    );






  }
}