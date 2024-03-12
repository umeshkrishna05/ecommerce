import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/mobile.dart';

class Cart extends ChangeNotifier {
  //list of products
  List<Mobile> productList = [
    Mobile(
        name: "Samsung Galaxy",
        price: "1,20,000",
        description: " Samsung Galaxy S23 5G (Green, 8GB, 256GB Storage)",
        imgpath: 'assets/images/samsung.jpeg'),
    Mobile(
        name: "iphone 15 pro",
        price: "30,000",
        imgpath: "assets/images/iphone.png",
        description: "Superb Modile phone"),
    Mobile(
        name: "Oneplus",
        price: "20,000",
        imgpath: "assets/images/oneplus.png",
        description: "oneplus 13 pro 156GB , 16GB"),
    Mobile(
        name: "Oppo",
        price: "20,000",
        imgpath: "assets/images/oppo.png",
        description: ""),
    Mobile(
        name: "Vivo",
        price: "20,000",
        imgpath: "assets/images/vivo.png",
        description: ""),
    Mobile(
        name: "Redmi",
        price: "20,000",
        imgpath: "assets/images/redmi.png",
        description: ""),
  ];
 
  //list of mobiles
  List<Mobile> usercart = [];

  //get list of mobiles for sale
  List<Mobile> getMobileslist() {
    return productList;
  }

  //get list of mobiles for usercart
  List<Mobile> getusercart() {
    return usercart;
  }

  // add items to cart
  void additems(Mobile mobile) {
    usercart.add(mobile);
  }

  void removeitems(Mobile mobile) {
    usercart.remove(mobile);
  }
}
