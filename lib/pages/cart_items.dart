// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:provider/provider.dart';

class Cartitems extends StatefulWidget {
  Mobile mobile;
  Cartitems({super.key, required this.mobile});

  @override
  State<Cartitems> createState() => _CartitemsState();
}

class _CartitemsState extends State<Cartitems> {
  void removeitems() {
    Provider.of<Cart>(context, listen: false).removeitems(widget.mobile);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.mobile.imgpath),
      title: Text(widget.mobile.name),
      subtitle: Text(widget.mobile.price),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: removeitems,
      ),
    );
  }
}
