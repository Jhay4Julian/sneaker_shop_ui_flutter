import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shoe.dart';
import '../models/cart.dart';

// ignore: must_be_immutable
class CartItemTile extends StatefulWidget {
  Shoe shoe;
  CartItemTile({super.key, required this.shoe});

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  // remove shoe from cart
  void removeShoeFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          onPressed: removeShoeFromCart,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
