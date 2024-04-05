import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_page.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  // _ProductDetailsPageState extends State which provides us the Context
  void onTab() {
    if (selectedSize == 0) {
      // To show alter from bottom
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select your shoe size"),
        ),
      );
      return;
    }
    // don't listen to the changes in CartProvider
    final prod = {...widget.product};
    prod.remove('sizes');
    prod['size'] = selectedSize;
    Provider.of<CartProvider>(context, listen: false).addProduct(prod);
    Navigator.of(context).push(
      // Here MaterialPageRoute is use for android transition from one route to another
      MaterialPageRoute(
        builder: (context) {
          return const CartPage();
        },
      ),
    );
          ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product added successfully!"),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Details",
      )),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0), // Adjust the radius as needed
                topRight: Radius.circular(40.0), // Adjust the radius as needed
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${widget.product['price']}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount:
                            (widget.product['sizes'] as List<int>).length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['sizes'] as List<int>)[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => setState(() {
                                selectedSize = size;
                              }),
                              child: Chip(
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                                label: Text(size.toString()),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: onTab,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart_checkout,
                              color: Colors.black),
                          SizedBox(width: 10),
                          Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
