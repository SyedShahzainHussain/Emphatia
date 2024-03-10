
import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';

class ColumnText extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final Color color2;
  final TextStyle? style;
  const ColumnText(
      {super.key,
      required this.title,
      required this.subTitle,
      this.color = TColors.white,
      this.color2 = TColors.white,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSized.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: style ??
                  Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: color)),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: color2),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
