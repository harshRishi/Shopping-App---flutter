import 'package:flutter/material.dart';

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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.black, fontSize: 18),
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
