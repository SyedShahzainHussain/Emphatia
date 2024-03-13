import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/psycology/psy_signin_view_model.dart';

class PsyForgotPassword extends StatelessWidget {
  final Function(String) onPressed;
  const PsyForgotPassword({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<PhySignInViewModel>(
        builder: (context,value,_)=>
        ModalProgressHUD(
          inAsyncCall: value.isForgotLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: Padding(
            padding: const EdgeInsets.all(TSized.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ! Headings
                Text(
                  TTexts.forgotPassTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSized.spacebetweenItem,
                ),
                Text(
                  TTexts.forgotPassSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: TSized.spacebetweenSections * 2,
                ),
          
                // ! Form Text
                TextFormField(
                  controller:emailController,
                    decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(
                          Iconsax.direct_right,
                        ))),
                const SizedBox(
                  height: TSized.spacebetweenSections,
                ),
          
                // ! Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=> onPressed(emailController.text),
                    child: Text(TTexts.submit.capitalize()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
