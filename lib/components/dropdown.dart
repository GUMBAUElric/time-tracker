import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTDropdown extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final List<String> dropDownItems;
  final Color? Function(String?)? dropDownItemsColors;
  final Function callBack;
  final String? defaultValue;

  const TTDropdown(
      {Key? key,
      this.hintText = "",
      this.labelText = "",
      required this.validator,
      required this.dropDownItems,
      required this.dropDownItemsColors,
      required this.callBack,
      this.defaultValue})
      : super(key: key);

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 15, color: dropDownItemsColors!(item)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          labelStyle: const TextStyle(color: TTColors.primary),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TTBorderRadius.small),
              borderSide: const BorderSide(color: TTColors.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TTBorderRadius.small),
              borderSide: const BorderSide(color: TTColors.primary)),
        ),
        isExpanded: true,
        iconSize: 30,
        itemHeight: 50,
        value: defaultValue,
        validator: validator,
        icon: const Icon(Icons.arrow_drop_down, color: TTColors.primary),
        items: dropDownItems.map(buildMenuItem).toList(),
        onChanged: (value) => callBack(value));
  }
}
