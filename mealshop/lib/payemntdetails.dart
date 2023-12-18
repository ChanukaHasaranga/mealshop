import 'package:flutter/material.dart';
import 'package:mealshop/cart.dart';
import 'package:mealshop/poymentsviewdetails.dart';

class payemts extends StatefulWidget {
String pay='';
List items=[];




   payemts({
    
    required this.pay,
    required this.items,
    super.key
    
    
    
    });

  @override
  State<payemts> createState() => _payemtsState();
}

class _payemtsState extends State<payemts> {

final name=TextEditingController();
final line1=TextEditingController();
final line2=TextEditingController();
final city=TextEditingController();
final number=TextEditingController();

String username='';
String usernumber='';
String useraddress1='';
String useraddress2='';
String usercity='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.transparent,
appBar:AppBar(
leading: IconButton(icon:const Icon(Icons.arrow_back), onPressed: () {

Navigator.of(context).push(MaterialPageRoute(builder:(context) {
  print(widget.pay);
  return CartPage();

},));


  },),



),


body: SingleChildScrollView(
scrollDirection: Axis.vertical,
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Padding(
padding: EdgeInsets.fromLTRB(36, 18, 30, 0),
  child:   Text("Enter the Delivery Address",style: TextStyle(fontSize: 20),),
),


const Padding(
padding: EdgeInsets.fromLTRB(36, 18, 30, 0),
  child:   Text("Name"),
),

Padding(
  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
  child:   TextField(
  keyboardType: TextInputType.name,
  
  controller: name,
  
  decoration: InputDecoration(
  
  
  
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
  
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: const BorderSide(color: Colors.white)),
  
  fillColor: Colors.amber,
  
                     
  
                                     
  
                     
  
  
  
  
  
  
  
  ),
  
  
  
  
  
  
  
  
  
  ),
),
const Padding(
padding: EdgeInsets.fromLTRB(36, 18, 30, 0),
  child:   Text("Addressline 1"),
),

Padding(
  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
  child:   TextField(
  keyboardType: TextInputType.name,
  
  controller: line1,
  
  decoration: InputDecoration(

  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
  
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: const BorderSide(color: Colors.white)),
  
  fillColor: Colors.amber,

  ),

  ),
),
const Padding(
padding: EdgeInsets.fromLTRB(36, 18, 30, 0),
  child:   Text("Addressline 2"),
),

Padding(
  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
  child:   TextField(
  keyboardType: TextInputType.name,
  
  controller: line2,
  
  decoration: InputDecoration(

  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
  
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: const BorderSide(color: Colors.white)),
  
  fillColor: Colors.amber,

  ),

  ),
),
const Padding(
padding: EdgeInsets.fromLTRB(36, 18, 30, 0),
  child:   Text("City"),
),

Padding(
  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
  child:   TextField(
  keyboardType: TextInputType.name,
  
  controller: city,
  
  decoration: InputDecoration(

  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
  
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: const BorderSide(color: Colors.white)),
  
  fillColor: Colors.amber,

  ),

  ),
),
const Padding(
padding: EdgeInsets.fromLTRB(36, 18, 30, 0),
  child:   Text("Phone Number"),
),

Padding(
  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
  child:   TextField(
  keyboardType: TextInputType.number,
  
  controller: number,
  
  decoration: InputDecoration(

  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color:Colors.amber)),
  
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(13),borderSide: const BorderSide(color: Colors.white)),
  
  fillColor: Colors.amber,

  ),

  ),
),

const Padding(
padding: EdgeInsets.fromLTRB(36, 26, 30, 0),
  child:   Text("Totall Amount to pay ",style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 219, 112, 4)),),
),
Padding(
padding: const EdgeInsets.fromLTRB(36, 10, 30, 0),
  child:   Text("Pay${widget.pay}",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
),
Padding(
    padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
    child: ElevatedButton(
  onPressed: () { 

    setState(() {
      
    
username=name.text;
useraddress1=line1.text;
useraddress2=line2.text;
usercity=city.text;
usernumber=number.text;




    });
Navigator.of(context).push(MaterialPageRoute(builder:(context) {


return payemntsviewdetails(name:username, line1: useraddress1, line2: useraddress2, city: usercity, number: usernumber, price: widget.pay, item: [widget.items],);

  
},));
print(widget.items[0][0][0]);

print(name.text);

   },
  style:ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 255, 127, 7),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                              fixedSize: const Size(370, 55),
  
  
  
  
  
  
  
  ),
  
  child: const Text("Process to Checkout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
  
  
    ),
  ),








],







),






),



    );








  }
}