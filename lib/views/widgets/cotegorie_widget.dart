import 'package:dars6/models/cotegorie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CotegorieWidget extends StatefulWidget {
  CotegorieModel model;
  CotegorieWidget({required this.model, super.key});

  @override
  State<CotegorieWidget> createState() => _CotegorieWidgetState();
}

class _CotegorieWidgetState extends State<CotegorieWidget> {
  String? imageError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 150,
          width: MediaQuery.of(context).size.width / 2 - 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: NetworkImage(
                  imageError == null ? widget.model.image : imageError!),
              onError: (exception, stackTrace) {
                imageError =
                    "https://i0.wp.com/sunrisedaycamp.org/wp-content/uploads/2020/10/placeholder.png";
                setState(() {});
              },
            ),
          ),
        ),
        const Gap(5),
        Text(
          widget.model.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
