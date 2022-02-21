import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTDropdown extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final List<String> dropDownItems;
  final Color? Function(String?)? dropDownItemsColors;


  const TTDropdown({Key? key,
    this.hintText = "",
    required this.validator,
    required this.dropDownItems,
    required this.dropDownItemsColors})
      : super(key: key);

  @override
  State<TTDropdown> createState() => _TTDropdownState();
}

class _TTDropdownState extends State<TTDropdown> {
  String? dropDownValue;

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style:
          TextStyle(fontSize: 15, color: widget.dropDownItemsColors!(item)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: widget.hintText,
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
        value: dropDownValue,
        iconSize: 30,
        itemHeight: 50,
        validator: widget.validator,
        icon: const Icon(Icons.arrow_drop_down, color: TTColors.primary),
        items: widget.dropDownItems.map(buildMenuItem).toList(),
        onChanged: (value) => setState(() => dropDownValue = value));
  }
}
