import 'package:dars6/controllers/cotegorie_controller.dart';
import 'package:dars6/models/cotegorie.dart';
import 'package:dars6/views/widgets/cotegorie_widget.dart';
import 'package:flutter/material.dart';

class CotegoriePage extends StatefulWidget {
  const CotegoriePage({super.key});

  @override
  State<CotegoriePage> createState() => _CotegoriePageState();
}

class _CotegoriePageState extends State<CotegoriePage> {
  final SecondController secondController = SecondController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cotegories Page')),
      body: FutureBuilder<List<CotegorieModel>>(
        future: secondController.getInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No products available'),
            );
          }

          final products = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CotegorieWidget(
                model: products[index],
              );
            },
          );
        },
      ),
    );
  }
}
