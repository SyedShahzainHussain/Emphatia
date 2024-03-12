import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:store/common/widget/verify_screen/widget/verify_button.dart';
import 'package:store/common/widget/verify_screen/widget/verify_title.dart';
import 'package:store/features/authentication/view/modules/patient/patient_login.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              THelperFunction.navigatedToScreenWithPop(
                  context, const PatientLogin());
            },
            icon: const Icon(
              CupertinoIcons.clear,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSized.defaultSpace),
          child: Column(
            children: [
              Image(
                width: TDeviceUtils.screenWidth(context) * 0.6,
                image: const AssetImage(
                  TImageString.verifiedSuccess,
                ),
              ),
              const SizedBox(
                height: TSized.spacebetweenSections,
              ),

              // ! Title & Subtitle

              const VerifyTitleSubTitle(),

              const SizedBox(
                height: TSized.spacebetweenSections,
              ),
              // ! Button

              const VerifyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
