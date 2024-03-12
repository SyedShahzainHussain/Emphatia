import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/features/authentication/model/pdf_file_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';

class THelperFunction {
  THelperFunction._();

  static Color? getColor(String value) {
    value = value.toLowerCase();
    if (value == "green") {
      return Colors.green;
    } else if (value == "red") {
      return Colors.red;
    } else if (value == "blue") {
      return Colors.blue;
    } else if (value == "purple") {
      return Colors.purple;
    } else if (value == "pink") {
      return Colors.pink;
    } else if (value == "grey") {
      return Colors.grey;
    } else if (value == "black") {
      return Colors.black;
    } else if (value == "white") {
      return Colors.white;
    } else {
      return null;
    }
  }

  static showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlertDialog(
      String title, String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            ));
  }

  static void showBottomSheet(
    BuildContext context,
    Function()? pickImage,
    Function()? pickGallery,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(TSized.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    pickImage!();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.camera),
                        const SizedBox(
                          width: TSized.spacebetweenItem,
                        ),
                        Text(
                          TTexts.camera,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSized.spacebetweenItem,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    pickGallery!();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.image),
                        const SizedBox(
                          width: TSized.spacebetweenItem,
                        ),
                        Text(
                          TTexts.gallery,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static void navigatedToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static void navigatedToScreenWithPop(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (context) => false,
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  static Widget showIndicator([double? size = 50]) {
    return SpinKitChasingDots(
      color: TColors.primary,
      size: size!,
    );
  }

  static Future<File> pickImageFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);
    return File(image!.path);
  }

  static Future<File> pickImageFromGallery() async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    return File(image!.path);
  }

  static Future<PdfFile?> pickFilePdf(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf'],
        type: FileType.custom,
      );
      if (result == null) {
        return null;
      }

      List<File> files = result.files.map((file) => File(file.path!)).toList();
      if (files.isEmpty) {
        return null;
      }

      File file = files.first;
      final pdfFile = PdfFile(file: file, filePath: file.path);
      showToast("Pdf Selected");
      return pdfFile;
    } catch (e) {
      showToast("Error picking file: $e");
      return null;
    }
  }
}
