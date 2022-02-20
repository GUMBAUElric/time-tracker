import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  const TTAppBar({Key? key, this.leading, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IconButton defaultLeadingButton = IconButton(
      icon: const Icon(Icons.arrow_back, color: TTColors.primary),
      onPressed: () => Navigator.pop(context),
    );

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: leading ?? defaultLeadingButton,
      title: title,
    );
  }
}
