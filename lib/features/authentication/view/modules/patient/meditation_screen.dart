import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/widget/appBar/custom_appbar.dart';
import 'package:store/data/response/status.dart';
import 'package:store/features/authentication/view/modules/patient/widget/meditation_music_player/meditation_music_player.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/get_meditaion_view_model.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  GetMeditationDataViewModel getMeditationDataViewModel =
      GetMeditationDataViewModel();

  @override
  void initState() {
    super.initState();
    getMeditationDataViewModel.getMeditationApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: Text("Meditation", style: TextStyle(color: Colors.black)),
      ),
      body: ChangeNotifierProvider(
        create: (context) => getMeditationDataViewModel,
        child:
            Consumer<GetMeditationDataViewModel>(builder: (context, value, _) {
          switch (value.apiResponse.status) {
            case Status.loading:
              return THelperFunction.showIndicator();

            case Status.error:
              return Center(
                child: Text(value.apiResponse.message!),
              );
            case Status.complete:
              return Container(
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
                                      child: Image.network(
                                        value.apiResponse.data![index].image
                                            .toString(),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    value.apiResponse.data![index].title
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        THelperFunction.navigatedToScreen(
                                            context,
                                            MeditationMusicPlayer(
                                              musicUrls: value
                                                  .apiResponse.data![index].url
                                                  .toString(),
                                              title: value.apiResponse
                                                  .data![index].title
                                                  .toString(),
                                            ));
                                      },
                                      icon: const Icon(
                                          Icons.arrow_forward_ios_rounded)),
                                ),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: TSized.spacebetweenItem,
                          ),
                      itemCount: value.apiResponse.data!.length));

            default:
              return const SizedBox();
          }
        }),
      ),
    );
  }
}
