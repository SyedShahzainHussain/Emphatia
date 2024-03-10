
import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/on_board/widget/column_text.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/device/devices_utility.dart';

class OnBoardQuestion extends StatelessWidget {
  const OnBoardQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: TDeviceUtils.screenHeight(context) / 3,
            child: PageView(
              children: [
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: ColumnText(
                      title: TTexts.logo,
                      subTitle: TTexts.aPlaceToFeelBetterTitle,
                      color2: TColors.primary,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white)),
                ),
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: const ColumnText(
                    title: TTexts.toolThatWorkTitle,
                    subTitle: TTexts.toolThatWorkSubTitle,
                    color2: TColors.darkGrey,
                    color: TColors.primary,
                  ),
                ),
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: const ColumnText(
                    title: TTexts.everyQuidedJourneyTitle,
                    subTitle: TTexts.everyQuidedJourneySubTitle,
                    color2: TColors.darkGrey,
                    color: TColors.primary,
                  ),
                ),
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: const ColumnText(
                    title: TTexts.meditationMadeEasyTitle,
                    subTitle: TTexts.meditationMadeEasySubTitle,
                    color2: TColors.darkGrey,
                    color: TColors.primary,
                  ),
                ),
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: const ColumnText(
                    title: TTexts.findYourCommunityTitle,
                    subTitle: TTexts.findYourCommunitySubTitle,
                    color2: TColors.darkGrey,
                    color: TColors.primary,
                  ),
                ),
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: const ColumnText(
                    title: TTexts.personalMentalHealthTitle,
                    subTitle: TTexts.personalMentalHealthSubTitle,
                    color2: TColors.darkGrey,
                    color: TColors.primary,
                  ),
                ),
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: const ColumnText(
                    title: TTexts.sanvelloLiveTitle,
                    subTitle: TTexts.sanvelloLiveSubTitle,
                    color2: TColors.darkGrey,
                    color: TColors.primary,
                  ),
                ),
                Container(
                  color: TColors.black.withOpacity(0.8),
                  child: const ColumnText(
                    title: TTexts.therapyAnyWhereTitle,
                    subTitle: TTexts.therapyAnyWhereSubTitle,
                    color2: TColors.darkGrey,
                    color: TColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
