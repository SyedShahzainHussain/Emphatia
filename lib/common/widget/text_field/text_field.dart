import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';

class TTextFieldContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;
  const TTextFieldContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackGround = true,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSized.defaultSpace),
      child: Container(
        width: TDeviceUtils.screenWidth(context),
        padding: const EdgeInsets.all(TSized.md),
        decoration: BoxDecoration(
          color: showBackGround
              ? isDark
                  ? TColors.black
                  : TColors.white
              : Colors.transparent,
          border: showBorder ? Border.all(color: TColors.grey) : null,
          borderRadius: BorderRadius.circular(TSized.cardRadiusLg),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: TColors.darkerGrey,
            ),
            const SizedBox(
              width: TSized.spacebetweenItem,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}