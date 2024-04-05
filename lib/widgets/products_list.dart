import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_varaible.dart';
import 'package:shop_app_flutter/widgets/product_cards.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Puma'];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return SafeArea(
      child: Column(
        children: [
          // Heading
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Shoes\nCollection",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
              ),
            )
          ]),

          // Filters
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8.0),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context)
                                .colorScheme
                                .primary // gettting it from seed's primary color using inheritance
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        label: Text(
                          filter,
                          style: const TextStyle(fontSize: 16),
                        )),
                  ),
                );
              },
            ),
          ),

          // Products
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      // Works similar to router in next
                      Navigator.of(context).push(
                        // Here MaterialPageRoute is use for android transition from one route to another
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailsPage(product: products[index]);
                          },
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
