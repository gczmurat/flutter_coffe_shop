import 'package:flutter/material.dart';

class SizeRow extends StatefulWidget {
  const SizeRow({super.key});

  @override
  State<SizeRow> createState() => _SizeRowState();
}

class _SizeRowState extends State<SizeRow> {
  String selectedSize = ''; // Seçili boyutun tutulacağı değişken

  void selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSizeBox('S', selectedSize == 'S'),
          buildSizeBox('M', selectedSize == 'M'),
          buildSizeBox('L', selectedSize == 'L'),
        ],
      ),
    );
  }

  Widget buildSizeBox(String size, bool isSelected) {
    return GestureDetector(
      onTap: () {
        selectSize(size); // Boyut seçildiğinde seçili boyutu güncelle
      },
      child: Container(
        margin: EdgeInsets.all(4),
        width: 50,
        height: 50,
        color:
            isSelected ? Colors.grey.shade600 : Colors.white, // Seçili boyutu renklendir
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : Colors.grey.shade600, // Seçili boyutun rengini değiştir
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
