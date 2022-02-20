import 'package:flutter/material.dart';
import 'package:time_tracker/base/base.dart';

class TTAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final bool showLeading;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  const TTAppBar({Key? key, this.leading, this.title, this.showLeading = true})
      : super(key: key);

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
      leading: showLeading ? (leading ?? defaultLeadingButton) : null,
      title: title,
    );
  }
}
