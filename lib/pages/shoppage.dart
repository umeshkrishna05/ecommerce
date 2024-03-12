import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mobileList.dart';

import 'package:flutter_application_1/products/cart.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void additemtocart(Mobile mobile) {
    Provider.of<Cart>(context, listen: false).additems(mobile);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 226, 226),
              borderRadius: BorderRadius.circular(9)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search'),
              Icon(Icons.search),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: SizedBox(
            height: 400, // Set the height as per your requirement
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 10, // Space between items horizontally
                mainAxisSpacing: 10, // Space between items vertically
              ),
              itemCount: value
                  .getMobileslist()
                  .length, // Use the length of your mobile list
              itemBuilder: (context, index) {
                Mobile mobile = value.getMobileslist()[index];
                return Mobiles(
                  mobile: mobile,
                  onTap: () => additemtocart(mobile),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Divider(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ]),
    );
  }
}
