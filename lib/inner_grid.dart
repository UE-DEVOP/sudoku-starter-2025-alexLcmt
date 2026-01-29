import 'package:flutter/material.dart';

class InnerGrid extends StatelessWidget {
  final double size;

  const InnerGrid({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          child: const Center(
            child: Text("T"),
          ),
        );
      }),
    );
  }
}
