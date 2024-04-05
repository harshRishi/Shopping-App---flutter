import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shop_app_flutter/global_varaible.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart; // can only be defined inside the BuildContext
    // ------ OR use short hand -------------
    final cart = context.watch<CartProvider>().cart; // this will rebuild each widget, to avoid this use Consumer
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl']
                  as String), // you can use NetworkImage in case Image from some URL
              radius: 30,
              // backgroundColor: Colo,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text(
                            "Delete Product",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: const Text(
                              'Are you sure you want to remove this product?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context)
                                  .pop(), // remove it from widget stack
                              child: const Text(
                                "No",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Provider.of<CartProvider>(context,
                                //         listen: false)
                                //     .removeProduct(cartItem);
                                // OR - use this short hand
                                context
                                    .read<CartProvider>()
                                    .removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ]);
                    });
                // Provider.of<CartProvider>(context, listen: false)
                //     .removeProduct(cartItem);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text("Size: ${cartItem['size']}"),
          );
        },
      ),
    );
  }
}
