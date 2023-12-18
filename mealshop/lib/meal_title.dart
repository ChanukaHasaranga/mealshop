import 'package:mealshop/details.dart';
import 'package:flutter/material.dart';

class mealtitle extends StatelessWidget {

String imagepath;
String name;
String subname;
String price;
void Function()? onPressed;


   mealtitle(
    {super.key, 
   required this.imagepath,
   required this.name,
   required this.subname,
    required this.price,
    required this.onPressed,

    }
    
    
    );

  @override
  Widget build(BuildContext context) {
    return Padding(

              padding: const EdgeInsets.only(left: 25,bottom: 25),
      
              child: InkWell(
              onTap: () {
                
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                              
                              return details(
                                subname:subname,
                                name: name, 
                              imagepath: imagepath,
                               price: price,
                               );
                          
                          
                           },
                           
                           )
                           );



              },


                child: Container(
                          
                padding: const EdgeInsets.all(12.0),
                width: 200,
                height: 330,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(175, 13, 13, 13)
                ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                     Padding(
                       padding: const EdgeInsets.only(left:8.3),
                       child: ClipRRect(
                        
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(imagepath,height:199,)),
                     ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        const SizedBox(height:5),
                        Text(subname,style: const TextStyle(fontSize: 11,color: Color.fromARGB(255, 129, 129, 129)),)
                      ],
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.only(left: 9),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 
                 Text("Rs$price(M)",style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                 Container(
                 width: 40,
                 height: 40,
                 
                   decoration: BoxDecoration(
                 
                 borderRadius: BorderRadius.circular(7),
                 color: Colors.amber
                   ),
                   child: IconButton(icon: const Icon(Icons.add), onPressed:onPressed
                   
                   
                   ,))
                 
                 
                 
                 ],
                 
                 
                 
                 
                   ),
                 )
                          
                          
                ],
                          
                          
                          
                          
                 ),
                          
                  
                          
                ),
              ),
            
            );








  }
}