import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mealshop/details.dart';

class searchpart extends StatefulWidget {


   const searchpart({
    
    super.key
    
    
    });

  @override
  State<searchpart> createState() => _searchpartState();
}

class _searchpartState extends State<searchpart> {
  var searchtext='';
 final searchtab=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: const Color.fromARGB(255, 29, 29, 29),

     appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        


     ),


body: SingleChildScrollView(
scrollDirection: Axis.vertical,
  child:   Column(
  
  
  
  mainAxisAlignment: MainAxisAlignment.start,
  
  
  
  children: [
  
  
  
  Padding(
  
    padding: const EdgeInsets.all(25),
  
    child:   SizedBox(
  
    
  
    height: 60,
  
    
  
    
  
    
  
    child: TextField(
  
    onChanged: (value) {
      setState(() {
        
     searchtext=value;


      });
    },
  
      keyboardType: TextInputType.name,
  
  cursorColor: Colors.amber, 
  
  
  
   controller: searchtab,
  
    
  
    decoration: InputDecoration(
  
    
  
    hintText: "find your meal...",
  
    
  
    hintStyle: TextStyle(color: Colors.grey.shade600),
  
    
  
    prefixIcon: const Icon(Icons.search,color: Colors.amber,),
  
    
  
    suffixIcon: IconButton(icon: const Icon(Icons.close,color: Colors.amber,), onPressed: () { 
  
    
  
    searchtab.clear();
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
     },),
  
    
  
     focusedBorder: OutlineInputBorder(
  
    
  
    borderRadius: BorderRadius.circular(13),
  
    
  
    borderSide: BorderSide(color: Colors.grey.shade600)
  
    
  
    
  
    
  
    
  
    
  
     ),
  
    
  
     enabledBorder: OutlineInputBorder(
  
    
  
      borderRadius: BorderRadius.circular(13),
  
    
  
      borderSide: BorderSide(color: Colors.grey.shade600)
  
    
  
     )
  
    
  
    
  
    
  
    ),
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    ),
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    ),
  
  ),
  
  Padding(
  
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  
    child:   Container(
  
          height: 230,
  
      decoration: BoxDecoration(
  
  
  
      color:Colors.transparent,
  
  
  
border:Border.all(color: Colors.transparent),
  
      ),
  
    
  
      child:   StreamBuilder<QuerySnapshot>(
  
    
  
        stream:FirebaseFirestore.instance.collection("Pizza").orderBy('name').where('name',isGreaterThanOrEqualTo:searchtext).where('name',isLessThan: '${searchtext}z' ).snapshots(),
  
  
  
        builder: (context, snapshot) {
  
          if(snapshot.hasError){
  
        return const Text("Connection error...");
  
  
  
        }
  
    
  
      
  
    
  
        if(snapshot.connectionState==ConnectionState.waiting){
  
    
  
      
  
    
  
      return const Text("Loading..");
  
  
  
    
  
        }
  
  
  
        var pizzasearchdoc=snapshot.data!.docs;
  
    
  
  
  
        return  ListView.builder(
  
    scrollDirection: Axis.vertical,
  
  
  
        itemCount: pizzasearchdoc.length,
  
    
  
        itemBuilder: (context, index) {
  
  
  
          return ListTile(
  
  onTap: () {
    
 Navigator.of(context).push(MaterialPageRoute(builder: (context) {
   
return details(subname: pizzasearchdoc[index]['uname'], name: pizzasearchdoc[index]['name'], imagepath: pizzasearchdoc[index]['imagepath'], price: pizzasearchdoc[index]['price']);


 },));


  },
  
            title: Text(pizzasearchdoc[index]['name'],style: const TextStyle(color: Color.fromARGB(255, 226, 119, 4),fontSize: 14,fontWeight: FontWeight.bold),),
  
  
  
            leading: ClipRRect(
  
  
  
      borderRadius: BorderRadius.circular(13),
  
  
  
      child: Image.network(pizzasearchdoc[index]['imagepath']),
  
    
  
  
  
            ),
  
  
  
      subtitle: Text(pizzasearchdoc[index]['price']),
  
  
  
          );
  
    
  
        },
  
    
  
  
  
        );
  
    
  
      
  
    
  
        }
  
    
  
      
  
    
  
      ),
  
    
  
    ),
  
  ),
    
  Padding(
  
    padding: const EdgeInsets.symmetric(horizontal: 20),
  
    child:   Container(
  
          height: 230,
  
      decoration: BoxDecoration(
  
  
  
      color:Colors.transparent,

  border: Border.all(color:Colors.transparent)
  
  
      ),
  
    
  
      child:   StreamBuilder<QuerySnapshot>(
  
    
  
        stream:FirebaseFirestore.instance.collection("Rice").orderBy('name').where('name',isGreaterThanOrEqualTo: searchtext).where('name',isLessThan: '${searchtext}z').snapshots(),
  
  
  
        builder: (context, snapshot) {
  
          if(snapshot.hasError){
  
        return const Text("Connection error...");
  
  
  
        }
  
    
  
      
  
    
  
        if(snapshot.connectionState==ConnectionState.waiting){
  
    
  
      
  
    
  
      return const Text("Loading..");
  
  
  
    
  
        }
  
  
  
        var ricesearchdoc=snapshot.data!.docs;
  
    
  
  
  
        return  ListView.builder(
  
    scrollDirection: Axis.vertical,
  
  
  
        itemCount: ricesearchdoc.length,
  
    
  
        itemBuilder: (context, index) {
  
  
  
          return ListTile(
  
   onTap: () {
    
 Navigator.of(context).push(MaterialPageRoute(builder: (context) {
   
return details(subname: ricesearchdoc[index]['uname'], name: ricesearchdoc[index]['name'], imagepath: ricesearchdoc[index]['imagepath'], price: ricesearchdoc[index]['price']);


 },));


  },
  
  
            title: Text(ricesearchdoc[index]['name'],style: const TextStyle(color: Color.fromARGB(255, 226, 119, 4),fontSize: 14,fontWeight: FontWeight.bold),),
  
  
  
            leading: ClipRRect(
  
  
  
      borderRadius: BorderRadius.circular(13),
  
  
  
      child: Image.network(ricesearchdoc[index]['imagepath']),
  
    
  
  
  
            ),
  
  
  
      subtitle: Text(ricesearchdoc[index]['price']),
  
  
  
          );
  
    
  
        },
  
    
  
  
  
        );
  
    
  
      
  
    
  
        }
  
    
  
      
  
    
  
      ),
  
    
  
    ),
  
  ),
    
  Padding(
  
    padding: const EdgeInsets.symmetric(horizontal: 20),
  
    child:   Container(
  
          height: 230,
  
      decoration: const BoxDecoration(
  
  
  
      color:Colors.transparent
  

  
  
  
      ),
  
    
  
      child:   StreamBuilder<QuerySnapshot>(
  
    
  
        stream: FirebaseFirestore.instance.collection("Nooldes").orderBy('name').where('name',isGreaterThanOrEqualTo: searchtext).where('name',isLessThan: "${searchtext}z").snapshots(),
  
  
  
        builder: (context, snapshot) {
  
          if(snapshot.hasError){
  
        return const Text("Connection error...");
  
  
  
        }
  
    
  
      
  
    
  
        if(snapshot.connectionState==ConnectionState.waiting){
  
    
  
      
  
    
  
      return const Text("Loading..");
  
  
  
    
  
        }
  
  
  
        var nooldessearchdoc=snapshot.data!.docs;
  
    
  
  
  
        return  ListView.builder(
  
    scrollDirection: Axis.vertical,
  
  
  
        itemCount: nooldessearchdoc.length,
  
    
  
        itemBuilder: (context, index) {
  
  
  
          return ListTile(
  
   onTap: () {
    
 Navigator.of(context).push(MaterialPageRoute(builder: (context) {
   
return details(subname: nooldessearchdoc[index]['uname'], name: nooldessearchdoc[index]['name'], imagepath: nooldessearchdoc[index]['imagepath'], price: nooldessearchdoc[index]['price']);


 },));


  },
  
  
            title: Text(nooldessearchdoc[index]['name'],style: const TextStyle(color: Color.fromARGB(255, 226, 119, 4),fontSize: 14,fontWeight: FontWeight.bold),),
  
  
  
            leading: ClipRRect(
  
  
  
      borderRadius: BorderRadius.circular(13),
  
  
  
      child: Image.network(nooldessearchdoc[index]['imagepath']),
  
    
  
  
  
            ),
  
  
  
      subtitle: Text(nooldessearchdoc[index]['price']),
  
  
  
          );
  
    
  
        },
  
    
  
  
  
        );
  
    
  
      
  
    
  
        }
  
    
  
      
  
    
  
      ),
  
    
  
    ),
  
  ),
    
  Padding(
  
    padding: const EdgeInsets.symmetric(horizontal: 20),
  
    child:   Container(
  
          height: 230,
  
      decoration: const BoxDecoration(
  
  
  
      color:Colors.transparent,
  
  
  
      ),
  
    
  
      child:   StreamBuilder<QuerySnapshot>(
  
    
  
        stream: FirebaseFirestore.instance.collection("Drinks").orderBy("name").where('name',isGreaterThanOrEqualTo: searchtext).where('name',isLessThan: "${searchtext}z").snapshots(),
  
  
  
        builder: (context, snapshot) {
  
          if(snapshot.hasError){
  
        return const Text("Connection error...");
  
  
  
        }
  
    
  
      
  
    
  
        if(snapshot.connectionState==ConnectionState.waiting){
  
    
  
      
  
    
  
      return const Text("Loading..");
  
  
  
    
  
        }
  
  
  
        var drinkssearchdoc=snapshot.data!.docs;
  
    
  
  
  
        return  ListView.builder(
  
    scrollDirection: Axis.vertical,
  
  
  
        itemCount: drinkssearchdoc.length,
  
    
  
        itemBuilder: (context, index) {
  
  
  
          return ListTile(
  
   onTap: () {
    
 Navigator.of(context).push(MaterialPageRoute(builder: (context) {
   
return details(subname: drinkssearchdoc[index]['uname'], name: drinkssearchdoc[index]['name'], imagepath: drinkssearchdoc[index]['imagepath'], price: drinkssearchdoc[index]['price']);


 },));


  },
  
  
            title: Text(drinkssearchdoc[index]['name'],style: const TextStyle(color: Color.fromARGB(255, 226, 119, 4),fontSize: 14,fontWeight: FontWeight.bold),),
  
  
  
            leading: ClipRRect(
  
  
  
      borderRadius: BorderRadius.circular(13),
  
  
  
      child: Image.network(drinkssearchdoc[index]['imagepath']),
  
    
  
  
  
            ),
  
  
  
      subtitle: Text(drinkssearchdoc[index]['price']),
  
  
  
          );
  
    
  
        },
  
    
  
  
  
        );
  
    
  
      
  
    
  
        }
  
    
  
      
  
    
  
      ),
  
    
  
    ),
  
  )
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ],
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ),
),



 


    );












  }
}