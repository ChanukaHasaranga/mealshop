import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealshop/cartmodel.dart';
import 'package:mealshop/firstpage.dart';
import 'package:mealshop/payemntdetails.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
   CartPage({super.key});

  List<List<dynamic>> name22=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon:const Icon(Icons.arrow_back), onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder:(context) {
          return const FirstPage();
        },)); },),
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: value.csrtitems.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      name22.add([value.csrtitems[index][0],value.csrtitems[index][2]]);

                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
color: const Color.fromARGB(157, 117, 117, 117),
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: Image.network(
                              value.csrtitems[index][3],
                              height: 78,
                            ),
                            title: Text(
                              value.csrtitems[index][0],
                              style: const TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Rs.' + value.csrtitems[index][2],
                              style: const TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                            trailing:IconButton( icon:const Icon(Icons.close), onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                      .removeitemfromcart(index);



                              },)
                          ),
                        ),
                      );
                    },

                  ),
                ),
              ),

              // total amount + pay now

              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:Colors.transparent
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,fontSize: 24),
                          ),

                          const SizedBox(height: 8),
                          // total price
                          Text(
                            'Rs.${value.calculation()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton(

                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder:(context) {

                        String pay=value.calculation();

                         
                       return payemts(pay: pay, items: [name22],);

                      },)); },

                     style: ElevatedButton.styleFrom(
shadowColor: const Color.fromARGB(255, 22, 22, 22),
fixedSize: const Size(124, 44),
                     backgroundColor:const Color.fromARGB(255, 255, 153, 0),

                     shape: RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(12),
                      
                    
                     


                     )

                      
                     ),
                      child: const Text("Pay Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 21),),





                      )                     
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}