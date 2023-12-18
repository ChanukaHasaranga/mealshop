
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mealshop/Mytab.dart';
import 'package:mealshop/cart.dart';
import 'package:mealshop/cartmodel.dart';
import 'package:mealshop/meal_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealshop/acountcreate.dart';
import 'package:mealshop/drawer.dart';
import 'package:mealshop/search.dart';
import 'package:provider/provider.dart';




class FirstPage extends StatefulWidget {

   const FirstPage(
    
    {
    
    super.key,
    
    
    });

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
   final  cartModel = CartModel();
  final search = TextEditingController();




  List <Widget> mytab=[

mytabs(
text: "Pizza",


),
mytabs(
text: "Rice",


),
mytabs(
text: "Nooldes",


),
mytabs(
text: "Drinks",


),



  ];

  

final currentuser=FirebaseAuth.instance.currentUser!;
final pizzafire=FirebaseFirestore.instance.collection("Pizza").snapshots();
final ricefire=FirebaseFirestore.instance.collection("Rice").snapshots();
final drinkfire=FirebaseFirestore.instance.collection("Drinks").snapshots();
final nooldesfire=FirebaseFirestore.instance.collection("Nooldes").snapshots();
List<List<dynamic>> newitem=[];
List<List<dynamic>> ricenewitem=[];
List<List<dynamic>> nooldesnewitem=[];
List<List<dynamic>> drinksnewitem=[];
List<List<dynamic>>allitemsearch=[];













  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    
      length:mytab.length,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
drawer:const Mydrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          
          actions:[
           IconButton(icon:const Icon(Icons.person), onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder:(context) => const acountcreate(),)); },)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(icon: const Icon(Icons.home), onPressed: () {}),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {
    
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                     
                     return CartPage();
    
    
                   },));
    
    
              }),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(icon: const Icon(Icons.search), onPressed: () {
print(allitemsearch);

              Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                return const searchpart(


                );

              },));


              }),
              label: "",
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Find the best Meal for you",
                style: GoogleFonts.aboreto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 46,
                ),
              ),
              const SizedBox(height: 30,),
              
            Center(
                 child: Container(
            
              height: 150,
            
              
            
            decoration: const BoxDecoration(
            
            image: DecorationImage(image:NetworkImage("https://usagif.com/wp-content/uploads/gifs/pizza-48.gif.webp"),fit: BoxFit.cover)
            
            
            
            
            
            ),
            
            
            
            
            
            
            
            
            
            
            ),
            
            
                ),
const SizedBox(height: 20,),
             
          Container(
    alignment: Alignment.topCenter,
    height: 26,
    child: TabBar(tabs:mytab),
    
    
    ),
    
    const SizedBox(height: 20,),
              SizedBox(
                height: 360,
                child: TabBarView(
    
                  children: [
    
                    
                    
                    StreamBuilder(
    
                    stream: pizzafire,
                    builder: (context,snapshot) {
                      if(snapshot.hasError){
                     return const Text("Connection Error");
    
    
    
                      }
                      if(snapshot.connectionState==ConnectionState.waiting){
                     return const Text("Loading....");
    
    
                      }
                   var pizzadoc=snapshot.data!.docs;
    
                      return Consumer<CartModel>(
                        
                        builder:(context, value, child) {
 
                        return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: pizzadoc.length,
                        itemBuilder:(context, index) {
                              
                        
                        newitem.add([pizzadoc[index]['name'],pizzadoc[index]['uname'],pizzadoc[index]['price'],pizzadoc[index]['imagepath']]);

                                     return mealtitle(
                                      
                                      imagepath:pizzadoc[index]['imagepath'],
                                       name: pizzadoc[index]['name'], 
                                       price: pizzadoc[index]['price'], 
                                       subname: pizzadoc[index]['uname'], 
                                       onPressed: () {
                        
                                                print(allitemsearch);

                        
                          print(newitem[0][2]);
                      
                          Provider.of<CartModel>(context,listen: false).additemtocart(newitem[index],index);
                        
                        
                                         },
                          
                                        
                                        
                                      );
                                      
                                        
                          }, 
                          
                                      );

                        }
                      );
                                       },
                                       
                    ),
  
                  
                    StreamBuilder(
                     
                     stream:ricefire,
                     builder: (context, snapshot) {
                       
                    if(snapshot.hasError){
                     return const Text("Connection Error");
                    }if(snapshot.connectionState==ConnectionState.waiting){
    
                      return const Text("Loading...");
    
    
                    }
    
                    var ricedoc=snapshot.data!.docs;
    
                      return Consumer<CartModel>(
                        builder: (context, value, child) {
                          
                      
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:ricedoc.length,
                          itemBuilder:(context, index) {
                            
                         
                                        ricenewitem.add([ricedoc[index]['name'],ricedoc[index]['uname'],ricedoc[index]['price'],ricedoc[index]['imagepath']]);

      return mealtitle(
                                        
                                        imagepath:ricedoc[index]["imagepath"],
                                         name:ricedoc[index]["name"], 
                                         price:ricedoc[index]["price"],   
                                         subname:ricedoc[index]["uname"],
                                                               onPressed: () { 
                          
                          
                              Provider.of<CartModel>(context,listen: false).riceadditemtocart(ricenewitem[index],index);
                          
                                                                },
                        
                                          
                                        );
                                          
                        }, 
                                        );
                                       
                        }
                      );
                                       },
                    ),
                  
                    StreamBuilder(
                      stream: nooldesfire,
                      builder: (context, snapshot) {
                        
                     if(snapshot.hasError){
                      return const Text("Connection Error");
    
                     }if(snapshot.connectionState==ConnectionState.waiting){
                    return const Text("Loading...");
    
    
                     }
    
                     var nooldesdoc=snapshot.data!.docs;
    
                      return Consumer<CartModel>(
                        builder: (context, value, child) {
                          
                        
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: nooldesdoc.length,
                          itemBuilder:(context, index) {
                          
                         nooldesnewitem.add([nooldesdoc[index]['name'],nooldesdoc[index]['uname'],nooldesdoc[index]['price'],nooldesdoc[index]['imagepath']]);
                                  
                                       return mealtitle(
                                        
                                        imagepath:nooldesdoc[index]["imagepath"],
                                         name: nooldesdoc[index]["name"], 
                                         price: nooldesdoc[index]["price"], 
                                         subname: nooldesdoc[index]["uname"],
                        
                                                             onPressed: () { 
                        
                        
                        Provider.of<CartModel>(context,listen: false).nooldesadditemtocart(nooldesnewitem[index], index);
                        
                                                              },
                        
                                          
                                        );
                                          
                        }, 
                                        );
                        }
                      );
                       },
    
                    ),
                  
                    StreamBuilder(
                     stream:drinkfire,
                     builder: (context, snapshot) {
                       
                    if(snapshot.hasError){
    
    return const Text("COnnection Error");
    
                    }if(snapshot.connectionState==ConnectionState.waiting){
    
    return const Text("Loading...");
    
                    }
    
                    var drinksdoc=snapshot.data!.docs;
    
                      return Consumer<CartModel>(

                        builder:(context, value, child) {
                          
                        
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: drinksdoc.length,
                          itemBuilder:(context, index) {
                            
                         drinksnewitem.add([drinksdoc[index]['name'],drinksdoc[index]['uname'],drinksdoc[index]['price'],drinksdoc[index]['imagepath']]);
                                  
                                       return mealtitle(
                                        
                                        imagepath:drinksdoc[index]["imagepath"],
                                         name: drinksdoc[index]["name"], 
                                         price: drinksdoc[index]["price"], 
                                         subname: drinksdoc[index]["uname"],
                                                               onPressed: () {  
                        
                        Provider.of<CartModel>(context,listen: false).drinksadditemtocart(drinksnewitem[index], index);
                        
                                                               },
                        
                                          
                                          
                                        );
                                          
                        }, 
                                        );
                        }
                      );
                                       },
                    ),
                   
                   
                  ]
                ),
              ),
    
              // Add your ListView or other widgets here
            ],
          ),
        ),
      ),
    );
  }
}
