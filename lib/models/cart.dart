import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeList = [
    // List of shoes for sale
    Shoe(
      name: 'Lite Racer Adapt 6.0',
      price: '70',
      description: '',
      imagePath: 'assets/images/Lite_Racer_Adapt_6.0.png',
    ),
    Shoe(
      name: 'X_PLRPHASE',
      price: '110',
      description: '',
      imagePath: 'assets/images/X_PLRPHASE.png',
    ),
    Shoe(
      name: 'OZWEEGO',
      price: '120',
      description: '',
      imagePath: 'assets/images/OZWEEGO.png',
    ),
    Shoe(
      name: 'Samba OG',
      price: '100',
      description: '',
      imagePath: 'assets/images/samba_OG.png',
    ),
    Shoe(
      name: 'Hoops 3.0 MID',
      price: '80',
      description: '',
      imagePath: 'assets/images/hOOPS_3.0_Mid.png',
    ),
  ];

  // List of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeList;
  }

  // get user cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
