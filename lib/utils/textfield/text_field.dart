import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.onChanged,
      this.prefix,
      required this.title,
      this.hintText,
      this.textEditingController});

  Function(String? text) onChanged;
  TextEditingController? textEditingController;
  Widget? prefix;
  String title;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
                padding: EdgeInsets.only(bottom: sizeChart.padding_8),
                child: Text(
                  title,
                  style: textStyles.font14Black,
                ),
              ),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
              hintStyle: textStyles.font14Grey,
              prefixIcon: prefix,
              counter: const Text(""),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorsData.grey),
                  borderRadius:
                      BorderRadius.circular(sizeChart.textFieldBorderRadius)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorsData.grey),
                  borderRadius:
                      BorderRadius.circular(sizeChart.textFieldBorderRadius))),
          controller: textEditingController,
          onChanged: onChanged,
          style: textStyles.font16Black,
        ),
      ],
    );
  }
}
