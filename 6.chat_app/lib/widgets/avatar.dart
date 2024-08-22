import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Avatar extends StatelessWidget {
  Avatar({super.key, required this.onSelectedImgUrl});

  final void Function(String url) onSelectedImgUrl;

  final List<String> _imageUrls = [
    'assets/images/avatar/img-01.jpg',
    'assets/images/avatar/img-02.jpg',
    'assets/images/avatar/img-03.jpg',
    'assets/images/avatar/img-04.jpg',
    'assets/images/avatar/img-05.jpg',
    'assets/images/avatar/img-06.jpg',
    'assets/images/avatar/img-07.jpg',
    'assets/images/avatar/img-08.jpg',
    'assets/images/avatar/img-09.jpg',
    'assets/images/avatar/img-10.jpg',
    'assets/images/avatar/img-11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with close button
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Avatar List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          // List of images
          Container(
            padding: const EdgeInsets.all(10),
            height: 300,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10, // Khoảng cách ngang giữa các phần tử
                runSpacing: 10, // Khoảng cách dọc giữa các hàng
                children: _imageUrls.map((url) {
                  return GestureDetector(
                    onTap: () {
                      onSelectedImgUrl(url);
                      Navigator.of(context).pop();
                    },
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
