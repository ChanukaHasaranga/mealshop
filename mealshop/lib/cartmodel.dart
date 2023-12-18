import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  List items = [];
  List riceitems=[];

 int bandara=0;

 


  List csrtitems = [];

  get cartItems => csrtitems;

  get productitems=> items;


  void additemtocart(List newitem,int index){
items=newitem;
csrtitems.add(items);
print(csrtitems);
notifyListeners();


  }
   void riceadditemtocart(List ricenewitem,int index){
items=ricenewitem;
csrtitems.add(items);
print(csrtitems);
notifyListeners();


  }
void nooldesadditemtocart(List nooldesnewitem,int index){

items=nooldesnewitem;
csrtitems.add(items);
notifyListeners();




}
void drinksadditemtocart(List drinksnewitem, int index){
items=drinksnewitem;
csrtitems.add(items);
notifyListeners();




}

void adddetailsitem(List detailsitem,int index){

  print(detailsitem);
items=detailsitem;
csrtitems.add(items);
notifyListeners();





}

void removeitemfromcart(int index){


csrtitems.removeAt(index);

notifyListeners();


}


String calculation(){

double totalprice=0;

for(int i=0;i<csrtitems.length;i++){

totalprice+=double.parse(csrtitems[i][2]);



  
}

return totalprice.toStringAsFixed(2);



}




}