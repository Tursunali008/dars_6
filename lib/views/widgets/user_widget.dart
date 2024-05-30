import 'package:dars6/models/user.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserWidget extends StatefulWidget {
  final UserModel user;

  const UserWidget(
    this.user, {
    super.key,
    required,
  });

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 128,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.user.avatar.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Image.network(
                    widget.user.avatar,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return const Column(
                        mainAxisSize: MainAxisSize.min,
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
            widget.user.email,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const Gap(5),
          Text(
            widget.user.name,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
