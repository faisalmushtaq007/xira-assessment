import 'package:ecommerce/app/pages/providers.dart';
import 'package:ecommerce/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserFavourites extends ConsumerWidget {
  const UserFavourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final favouritesViewModel = ref.watch(favouritesProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Flexible(
                    child: Text(
                      "Favourites",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
              favouritesViewModel.productsBag.isEmpty
                  ? const EmptyWidget()
                  : Flexible(
                      child: ListView.builder(
                        itemCount: favouritesViewModel.totalProducts,
                        itemBuilder: (context, index) {
                          final product = favouritesViewModel.productsBag[index];
                          return ListTile(
                            leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          product.imageUrl,
                                        ),
                                      ),
                                    ),
                            title: Text(product.name),
                            subtitle: Text("₹" + product.price.toString()),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                favouritesViewModel.removeProduct(product);
                              },
                            ),
                          );
                        },
                      ),
                    ),
             
            ],
          ),
        ),
      ),
    );
  }
}
