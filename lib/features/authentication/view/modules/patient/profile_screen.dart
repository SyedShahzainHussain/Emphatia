import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/model/user_model.dart';
import 'package:store/features/authentication/view/modules/patient/widget/profile_screen_widget/profile_widget.dart';
import 'package:store/features/authentication/view/modules/patient/widget/profile_screen_widget/term_widget.dart';
import 'package:store/features/authentication/view/splash_screen/splash_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/services/user_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<User> getUserData() => UserViewModel().getUser();
  Map<String, dynamic>? data;

  void getUser() async {
    getUserData().then((value) {
      data = {
        "email": value.email ?? "",
        "gender": value.gender ?? "",
        "age": value.age ?? ""
      };
      setState(() {});
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 4.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.elliptical(
                                      MediaQuery.sizeOf(context).width,
                                      125.0))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ProfileWidget(
                        icon: Icons.email,
                        title: "Email",
                        info: data!["email"]),
                    const SizedBox(
                      height: 30.0,
                    ),
                    data!["age"] != ""
                        ? ProfileWidget(
                            icon: Icons.person,
                            title: "Age",
                            info: data!["age"])
                        : const SizedBox(),
                    if (data!["age"] != "")
                      const SizedBox(
                        height: 30.0,
                      ),
                    data!["gender"] != ""
                        ? ProfileWidget(
                            icon: Iconsax.maximize_circle,
                            title: "Gender",
                            info: data!["gender"])
                        : const SizedBox(),
                    if (data!["age"] != "")
                      const SizedBox(
                        height: 30.0,
                      ),
                    TermsWidget(
                        icon: Icons.logout,
                        title: "LogOut",
                        onTap: () {
                          context.read<UserViewModel>().remove().then((value) {
                            context.read<UserViewModel>().removeUserType();
                            THelperFunction.navigatedToScreenWithPop(
                                context, const SplashScreen());
                          });
                        }),
                  ],
                ),
              ),
            ),
    );
  }
}
