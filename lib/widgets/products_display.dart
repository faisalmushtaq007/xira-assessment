import 'package:ecommerce/app/pages/admin/product.dart';
import 'package:ecommerce/app/pages/product/product_detail.dart';
import 'package:ecommerce/app/pages/providers.dart';
import 'package:ecommerce/extensions/string_ext.dart';
import 'package:ecommerce/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsDisplay extends ConsumerWidget {
  const ProductsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritesViewModel = ref.watch(favouritesProvider);
    return StreamBuilder<List<Product>>(
        stream: ref.read(databaseProvider)!.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            if (snapshot.data!.isEmpty) {
              return const EmptyWidget();
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final product = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(product: product)));
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: product.name.capitalize(),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        product.imageUrl,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "₹" + product.price.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: Material(
                              child: IconButton(onPressed: (){
                                if(favouritesViewModel.productsBag.where((element) => element.id == product.id).isEmpty){
                                favouritesViewModel.addProduct(product);
                                }else{
                                favouritesViewModel.removeProduct(product);
                                }
                              },
                              splashRadius: 20,
                               icon: Icon(Icons.favorite, color: favouritesViewModel.productsBag.where((element) => element.id == product.id).isEmpty ? Colors.grey.shade400 : Colors.redAccent,)),
                            ))
                        ],
                      ),
                    );
                  }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
