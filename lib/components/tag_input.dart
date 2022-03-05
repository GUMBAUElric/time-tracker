import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:time_tracker/base/base.dart';

class TTTagInput extends StatelessWidget {
  final List<String> tags;

  const TTTagInput({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      onTag: (tag) => tags.add(tag),
      onDelete: (tag) => tags.remove(tag),
      tagsStyler: TagsStyler(
          tagTextStyle: const TextStyle(color: Colors.white),
          tagTextPadding: const EdgeInsets.symmetric(horizontal: 5),
          tagDecoration: BoxDecoration(
            color: TTColors.primary,
            borderRadius: BorderRadius.circular(TTBorderRadius.small),
          ),
          tagCancelIcon:
              const Icon(Icons.cancel, size: 18.0, color: Colors.white),
          tagPadding: const EdgeInsets.all(6.0)),
      textFieldStyler: TextFieldStyler(
          hintText: "Invite colleagues ?",
          helperText: "",
          cursorColor: TTColors.primary,
          textFieldFocusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TTBorderRadius.small),
              borderSide: const BorderSide(color: TTColors.primary, width: 1)),
          textFieldBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TTBorderRadius.small),
              borderSide: const BorderSide(color: TTColors.primary, width: 1))),
    );
  }
}
