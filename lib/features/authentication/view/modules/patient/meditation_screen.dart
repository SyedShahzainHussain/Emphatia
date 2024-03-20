import 'package:flutter/material.dart';
import 'package:store/common/widget/appBar/custom_appbar.dart';
import 'package:store/features/authentication/view/modules/patient/widget/meditation_music_player/meditation_music_player.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Meditation"),
      ),
      body: Container(
          padding: const EdgeInsets.all(TSized.defaultSpace),
          child: ListView.separated(
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(12),
                      child: ClipRRect(
                        child: ListTile(
                          tileColor: THelperFunction.isDarkMode(context)
                              ? TColors.primary
                              : TColors.accent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/images/music/music_cd.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          title: const Text(
                            "Khuda Ki Azmatain",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                THelperFunction.navigatedToScreen(
                                    context, const MeditationMusicPlayer());
                              },
                              icon:
                                  const Icon(Icons.arrow_forward_ios_rounded)),
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: TSized.spacebetweenItem,
                  ),
              itemCount: 10)),
    );
  }
}
