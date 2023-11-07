import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert user of addition to cart
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Added to Cart!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              'The best... Only the best!',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // top picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot picks',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.blue),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // shoes list display
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                // get the shoe list
                Shoe shoe = value.getShoeList()[index];
                // return shoe list
                return ShoeTile(
                  shoe: shoe,
                  onPressed: () => addShoeToCart(shoe),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25, top: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
