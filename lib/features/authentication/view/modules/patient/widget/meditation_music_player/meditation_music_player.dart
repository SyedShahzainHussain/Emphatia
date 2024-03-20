import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:store/common/widget/animation/circular_animation.dart';
import 'package:store/common/widget/appBar/custom_appbar.dart';

import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/helper/helper_function.dart';

class MeditationMusicPlayer extends StatefulWidget {
  const MeditationMusicPlayer({super.key});

  @override
  State<MeditationMusicPlayer> createState() => _MeditationMusicPlayer();
}

class _MeditationMusicPlayer extends State<MeditationMusicPlayer> {
  String musicUrl =
      "assets/naat/khuda-ki-azmatain-kya-hain.mp3"; // Insert your music URL
  String thumbnailImgUrl =
      "https://syaria.com/wp-content/uploads/2013/09/Music-CD.jpg"; // Insert your thumbnail URL

  var player = AudioPlayer();
  bool loaded = false;
  bool playing = false;

  void loadMusic() async {
    await player.setAsset(musicUrl);
    setState(() {
      loaded = true;
    });
  }

  void playMusic() async {
    setState(() {
      playing = true;
    });
    await player.play();
  }

  void pauseMusic() async {
    setState(() {
      playing = false;
    });
    await player.pause();
  }

  @override
  void initState() {
    loadMusic();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: Text("Khuda Ki Azmatain"),
          showBackArrow: true,
        ),
        body: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            CircularAnimation(
              widget: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/music/music_cd.png",
                  height: 350,
                  width: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: StreamBuilder(
                  stream: player.positionStream,
                  builder: (context, snapshot1) {
                    final Duration duration = loaded
                        ? snapshot1.data as Duration
                        : const Duration(seconds: 0);
                    return StreamBuilder(
                        stream: player.bufferedPositionStream,
                        builder: (context, snapshot2) {
                          final Duration bufferedDuration = loaded
                              ? snapshot2.data as Duration
                              : const Duration(seconds: 0);
                          return SizedBox(
                            height: 30,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ProgressBar(
                                progress: duration,
                                total: player.duration ??
                                    const Duration(seconds: 0),
                                buffered: bufferedDuration,
                                timeLabelPadding: -1,
                                timeLabelTextStyle: TextStyle(
                                    fontSize: 14,
                                    color: THelperFunction.isDarkMode(context)
                                        ? Colors.white
                                        : Colors.black),
                                progressBarColor: TColors.primary,
                                baseBarColor: Colors.grey[200],
                                bufferedBarColor: Colors.grey[350],
                                thumbColor: TColors.primary,
                                onSeek: loaded
                                    ? (duration) async {
                                        await player.seek(duration);
                                      }
                                    : null,
                              ),
                            ),
                          );
                        });
                  }),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: loaded
                        ? () async {
                            if (player.position.inSeconds >= 10) {
                              await player.seek(Duration(
                                  seconds: player.position.inSeconds - 10));
                            } else {
                              await player.seek(const Duration(seconds: 0));
                            }
                          }
                        : null,
                    icon: const Icon(Icons.fast_rewind_rounded)),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColors.primary,
                  ),
                  child: IconButton(
                      onPressed: loaded
                          ? () {
                              if (playing) {
                                pauseMusic();
                              } else {
                                playMusic();
                              }
                            }
                          : null,
                      icon: Icon(
                        playing ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      )),
                ),
                IconButton(
                    onPressed: loaded
                        ? () async {
                            if (player.position.inSeconds + 10 <=
                                player.duration!.inSeconds) {
                              await player.seek(Duration(
                                  seconds: player.position.inSeconds + 10));
                            } else {
                              await player.seek(const Duration(seconds: 0));
                            }
                          }
                        : null,
                    icon: const Icon(Icons.fast_forward_rounded)),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ));
  }
}
