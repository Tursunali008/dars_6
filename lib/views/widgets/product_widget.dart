import 'package:dars6/models/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Image.network(
                    product.images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Column(
                        children: [
                          Center(child: Icon(Icons.error, color: Colors.red)),
                          Text(
                            "Bu yerda surat bolish kerak edi",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                );
              },
            ),
          ),
          const Gap(5),
          Text(
            "\$${product.price}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const Gap(5),
          Text(
            product.title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Gap(5),
          Text(
            product.description,
            style: const TextStyle(fontSize: 8, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
