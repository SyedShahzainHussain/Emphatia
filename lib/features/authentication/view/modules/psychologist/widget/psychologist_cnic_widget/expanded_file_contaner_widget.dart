
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';

class ExpandedFileContainer extends StatelessWidget {
  final File? image;
  final Function? onPress;
  final Widget? icon;
  const ExpandedFileContainer(
      {super.key,
      required this.image,
      required this.onPress,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        if (image != null) {
          onPress!();
        }
      },
      child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: TColors.primary),
              borderRadius: BorderRadius.circular(TSized.cardRadiusMd),
              image: image == null
                  ? null
                  : DecorationImage(
                      image: FileImage(File(image!.path)), fit: BoxFit.cover)),
          child: image == null
              ? Center(
                  child: IconButton(
                      onPressed: () {
                        onPress!();
                      },
                      icon: icon!),
                )
              : const SizedBox()),
    ));
  }
}
