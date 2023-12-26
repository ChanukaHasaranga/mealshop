import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mealshop/cartmodel.dart';
import 'package:mealshop/firstpage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'package:http/http.dart'as http;


class payemntsviewdetails extends StatelessWidget {
String name;
String line1;
String line2;
String city;
String number;
String price;
List item;




   payemntsviewdetails({

    required this.name,
        required this.line1,
    required this.line2,
    required this.city,
    required this.number,
    required this.price,
required this.item,
    
    super.key
    
    
    
    });

    List itemreciept=[];
    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Consumer<CartModel>(


  builder: (BuildContext context, CartModel value, Widget? child) {  
  return  Padding(
  
    padding: const EdgeInsets.symmetric(vertical: 120,horizontal: 30),
  
    child:   Column(
  
    
  
    crossAxisAlignment: CrossAxisAlignment.start,
  
    
  
    children: [
  
    
  
    
  
    
  
      const Center(child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text("Payemnt Reciept",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      )),
  
    
  
    
  
    
  
    Padding(
  
      padding: const EdgeInsets.all(12),
  
      child: Text("Name:$name",style: const TextStyle(fontSize: 20),),
  
    ),
  
    
  
    Padding(
  
      padding: const EdgeInsets.all(12),
  
      child: Text("Address:$line1/$line2/$city",style: const TextStyle(fontSize: 20),),
  
    ),
    Padding(
  
      padding: const EdgeInsets.all(12),
  
      child: Text("Number:$number",style: const TextStyle(fontSize: 20),),
  
    ),
     const Padding(
  
      padding: EdgeInsets.fromLTRB(12, 12, 12, 2),
  
      child: Text("Orders",style: TextStyle(fontSize: 20),),
  
    ),
  Expanded(
  child: ListView.builder(
    itemCount: value.csrtitems.length,
    padding: const EdgeInsets.all(12),
    itemBuilder: (context, index) {
      // You need to return a widget here
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Text("${value.csrtitems[index][0]} :Rs ${value.csrtitems[index][2]}",style: const TextStyle(fontSize: 20),),
        ),
      );
    },
  ),
),

const Padding(
padding: EdgeInsets.fromLTRB(36, 26, 30, 0),
  child:   Text("Totall Amount to pay ",style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 219, 112, 4)),),
),
Padding(
padding: const EdgeInsets.fromLTRB(36, 10, 30, 0),
  child:   Text("Rs. $price",style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
),
Padding(
    padding: const EdgeInsets.fromLTRB(30, 25, 30, 15),
    child: ElevatedButton(
  onPressed: ()  async { 

String emailcontent = '''
                      Payment Receipt
                      
                      Name: $name
                      Address: $line1/$line2/$city
                      Number: $number
                      Total Amount: Rs. $price
                      ''';

final Uri emailApiUri=Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
const serviceid="service_bay3wld";
const templateId='template_0ekrw06';
try{
final response=await http.post(

emailApiUri,
headers: {'Content-Type':'application/json'},
body: json.encode({

"Service_ID":serviceid,
"template_id":templateId,
"template_parase":{
"name":name,
"subject":"Payment Receipt!!",
"message":emailcontent



},



})



  );

   if (response.statusCode == 200) {
    print("Email sent to app owner");
  } else {
    print("Email send fail");
  }
} catch (e) {
  print("Exception occurred: $e");
}
  
  Navigator.of(context).push(MaterialPageRoute(builder:(context) => FirstPage(),));

                    },     







  
  


   
  style:ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 255, 127, 7),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                              fixedSize: const Size(370, 55),
  
  
  
  
  
  
  
  ),
  
  child: const Text("Checkout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
  
  
    ),
  ),


  
   
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    ],
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    ),
  
  );
  }
),















    );






  }
}