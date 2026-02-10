import 'package:flutter/material.dart';

class DoubleInput extends StatelessWidget {
  final bool isValidated;
  final TextEditingController minPlayers;
  final TextEditingController maxPlayers;

  const DoubleInput({
    super.key,
    required this.isValidated,
    required this.minPlayers,
    required this.maxPlayers,
  });

  String? validator(String? _) {
    // case 1: both empty
    if (minPlayers.text.isEmpty && maxPlayers.text.isEmpty) {
      return null;
    }

    var min = int.tryParse(minPlayers.text);
    var max = int.tryParse(maxPlayers.text);

    // case 2: both filled with rules followed
    if ((min != null && max != null) && (min > 0 && (max > 0 && max >= min))) {
      return null;
    }

    // case 3: something is wrong
    return '_'; // actual error will never be shown
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Player Count',
          style: TextStyle(color: isValidated ? Colors.black : Colors.red),
        ),
        Stack(
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(
              height: 77,
              child: Column(
                children: [
                  Row(
                    children: [
                      customFormFiled("Min", minPlayers),
                      Container(width: 1, height: 40, color: Colors.grey),
                      customFormFiled("Max", maxPlayers),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Expanded customFormFiled(String hintText, TextEditingController controller) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        errorBuilder: (context, errorText) => SizedBox(),
        validator: validator,
        decoration: InputDecoration(
          counterText: "",
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          hintStyle: TextStyle(color: isValidated ? Colors.black : Colors.red),
        ),
        maxLength: 3,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
