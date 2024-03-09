import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants/size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool showBackArrow;
  final VoidCallback? leadingOnPress;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  const CustomAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingOnPress,
      this.actions,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSized.md),
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: title,
        actions: actions,
        leading: showBackArrow
            ? IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(onPressed: leadingOnPress, icon: Icon(leadingIcon))
                : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(TSized.appBarHeight);
}
