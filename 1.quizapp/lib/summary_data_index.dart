import 'package:flutter/material.dart';

class SummaryDataIndex extends StatelessWidget {
  const SummaryDataIndex({
    super.key,
    required this.dataIndex,
    required this.result,
  });
  final String dataIndex;
  final int result;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: result == 1 ? Colors.lightBlue : Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 12,
        ),
        child: Text(
          dataIndex,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
