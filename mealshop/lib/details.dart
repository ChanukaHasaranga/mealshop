import 'package:flutter/material.dart';
import 'package:mealshop/cartmodel.dart';
import 'package:mealshop/firstpage.dart';
import 'package:provider/provider.dart';

class details extends StatefulWidget {

  String name;
  String subname;
  String imagepath;
  String price;


   details({super.key, 
    
    required this.subname,
    required this.name,
    required this.imagepath,
    required this.price,

    
    });




  @override
  State<details> createState() => _detailsState();
}



class _detailsState extends State<details> {

String size="";
double fixprice=0;
 List countlist=[];
  int count=0;

List detailsitem=[];
int i=0;

  @override
  Widget build(BuildContext context) {
    
return Scaffold(

        backgroundColor: const Color.fromARGB(255, 29, 29, 29),

appBar: AppBar(

backgroundColor: Colors.transparent,

leading: IconButton(icon:const Icon(Icons.arrow_back,color: Color.fromARGB(255, 68, 67, 67),), onPressed: () { 

Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  
  
return  const FirstPage();


},)
);



 },),





),

body:SingleChildScrollView(
  
scrollDirection:Axis.vertical,

child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.start,

children: [

Container(
  height: 400,
decoration: BoxDecoration(
  image: DecorationImage(image:NetworkImage(widget.imagepath),fit:BoxFit.cover),
borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))


),


child: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
        Container(
    
    
    
    
    
    
    height: 150,
    
    alignment: Alignment.bottomCenter,
    decoration: const BoxDecoration(
color: Color.fromARGB(157, 117, 117, 117),
borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),


    ),
    
    
    child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [

 Padding(
   padding: const EdgeInsets.symmetric(horizontal:20,vertical: 35),
child:Column(
mainAxisAlignment: MainAxisAlignment.start,  
children: [


    Text(widget.name,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),

      const SizedBox(height: 5,),


    Container(
      child: Text(widget.subname,style: const TextStyle(color:Color.fromARGB(255, 237, 237, 237),fontSize: 18),)),

    
 






],



)


 ),


Column(

crossAxisAlignment: CrossAxisAlignment.start,

mainAxisAlignment: MainAxisAlignment.center,

children: [



Padding(
  padding: const EdgeInsets.only(left: 2),
  child:   Row(
  
  
  
  mainAxisAlignment: MainAxisAlignment.start,
  
  
  
  children: [
  
  
  
  
  
  
  
  Container(
  
  
  
  width: 40,
  
  height: 40,
  
  decoration: BoxDecoration(
  
  borderRadius: BorderRadius.circular(10),
  
  color: const Color.fromARGB(255, 1, 6, 11),
  
  boxShadow: const [BoxShadow(
  
  blurRadius: 15,
  
  spreadRadius: 1
  
  
  
  )]
  
  
  
  ),
  
  child:const Icon(Icons.fire_extinguisher,color: Color.fromARGB(255, 190, 98, 12),),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ),
  
  const SizedBox(width: 16,),
  
  
  
  Container(
  
  
  
    
  
  width: 40,
  
  height: 40,
  
  decoration: BoxDecoration(
  
  borderRadius: BorderRadius.circular(10),
  
  color: const Color.fromARGB(255, 1, 6, 11),
  
  boxShadow: const [BoxShadow(
  
  blurRadius: 15,
  
  spreadRadius: 1
  
  
  
  )]
  
  
  
  ),
  
  
  
  child:const Icon(Icons.icecream,color: Color.fromARGB(255, 190, 98, 12),),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ),
  
  
  
  const SizedBox(width: 15,)
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ],
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  ),
),
const SizedBox(height: 13,),

Padding(
  padding: const EdgeInsets.only(right: 20),
  child:   Container(
  
    height: 35,
  
    width: 105,
  
  decoration: BoxDecoration(

  color: const Color.fromARGB(255, 5, 27, 46),

borderRadius: BorderRadius.circular(12),

boxShadow: const [BoxShadow(
  
  blurRadius: 15,
  
  spreadRadius: 1
  
  
  
  )]


  ),
  
  child: const Center(child: Text("Medium Roasted",style: TextStyle(color: Colors.white,fontSize: 12),)),
  
  
  
  
  
  
  
  
  
  ),
)






],









)


],




    ),
    
    ),


  ],
),


),






const Padding(
  padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
  child:   Text("Description",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 18),),
),
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child:   Text("A cappuccino is an espresso-based coffee drink that originated in Italy. It's typically made with equal parts of espresso, steamed milk, and milk foam. ",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 17),),
),

Padding(
  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
  children: [
  
  
  
  ElevatedButton(
    style: ElevatedButton.styleFrom(
  
  backgroundColor:Colors.transparent,
  
  fixedSize: const Size(100, 35),
  
  shape:RoundedRectangleBorder(

  borderRadius: BorderRadius.circular(12)
    )
    ),
    onPressed: () { 

      setState(() {

        size="S";

fixprice=0;

fixprice=double.parse(widget.price)-200;
        
      });



print(fixprice);




     },
    child: const Text("S",style: TextStyle(color: Color.fromARGB(255, 237, 156, 4)),),
  
  ),
   ElevatedButton(
    style: ElevatedButton.styleFrom(
  
  backgroundColor:Colors.transparent,
  
  fixedSize: const Size(100, 35),
  
  shape:RoundedRectangleBorder(

  borderRadius: BorderRadius.circular(12)
    )
    ),
    onPressed: () {
setState(() {
  
size="M";
fixprice=double.parse(widget.price);


});



print(fixprice);

      },
    child: const Text("M",style: TextStyle(color: Color.fromARGB(255, 237, 156, 4)),),
  
  ),
   ElevatedButton(
    style: ElevatedButton.styleFrom(
  
  backgroundColor:Colors.transparent,
  
  fixedSize: const Size(100, 35),
  
  shape:RoundedRectangleBorder(

  borderRadius: BorderRadius.circular(12)
    )
    ),
    onPressed: () { 
setState(() {
  
size="L";

fixprice=double.parse(widget.price)+200;


});



     },
    child: const Text("L",style: TextStyle(color: Color.fromARGB(255, 237, 156, 4)),),
  
  )
  
  
  
  
  
  
  
  
  
  ],
  
  
  
  
  
  
  
  
  
  
  
  ),
),



Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child:   Row(
  
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
  children: [
  
  Container(
  
  child: Column(
  
    mainAxisAlignment: MainAxisAlignment.center,
  
  children: [
  
  
  
  
  
  const Center(child: Text("Price",style: TextStyle(fontSize: 17),)),
  const SizedBox(height: 4,),
Row(
mainAxisAlignment: MainAxisAlignment.start,

children: [
    
    const Text("Rs. ",style: TextStyle(color:Color.fromARGB(255, 255, 153, 0),fontSize: 23,fontWeight: FontWeight.bold),),


  Text(fixprice.toStringAsFixed(2),style: const TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),

      Text(" ($size)",style: const TextStyle(color:Color.fromARGB(255, 255, 153, 0),fontSize: 23,fontWeight: FontWeight.bold),),




],


),

  
  
  
  
  
  
  
  
  
  ],
  
  
  
  
  
  
  
  
  
  
  
  
  
  ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  ),

  ElevatedButton(
    
    style: ElevatedButton.styleFrom(
maximumSize: const Size(170, 60),
backgroundColor: const Color.fromARGB(255, 254, 119, 9),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20)

)


), 



onPressed: () { 
detailsitem.add([widget.name,widget.subname,fixprice.toStringAsFixed(0),widget.imagepath]);
print(detailsitem);


for(int j=0;j<detailsitem.length;j++){

Provider.of<CartModel>(context,listen: false).adddetailsitem(detailsitem[j],j);

}

 },
    
    child:const Center(child: Text("Buy Now",style: TextStyle(fontSize: 22),),),




    ),
    
    
    





  
  


  
  
  ],
  
  
  
  
  
  ),
),

const SizedBox(height: 10,)


],





),




),





);




  }




}