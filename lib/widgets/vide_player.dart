import 'package:flutter/material.dart';
import 'package:modern_player/modern_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // Theme option for modern_player
  var themeOptions = ModernPlayerThemeOptions(
      backgroundColor: Colors.black,
      menuBackgroundColor: Colors.black,
      loadingColor: Colors.blue,
      menuIcon: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
      volumeSlidertheme: ModernPlayerToastSliderThemeOption(
          sliderColor: Colors.blue, iconColor: Colors.white),
      progressSliderTheme: ModernPlayerProgressSliderTheme(
          activeSliderColor: Colors.blue,
          inactiveSliderColor: Colors.white70,
          bufferSliderColor: Colors.black54,
          thumbColor: Colors.white,
          progressTextStyle: const TextStyle(
              fontWeight: FontWeight.w400, color: Colors.white, fontSize: 18)));

  // Controls option for modern_player
  var controlsOptions = ModernPlayerControlsOptions(
      showControls: true,
      doubleTapToSeek: true,
      showMenu: true,
      showMute: false,
      showBackbutton: false,
      enableVolumeSlider: true,
      enableBrightnessSlider: true,
      showBottomBar: true,
      customActionButtons: [
        ModernPlayerCustomActionButton(
          icon: const Icon(
            Icons.info_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            // On Pressed
          },
        ),
      ]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ModernPlayer.createPlayer(
        // 字幕
        subtitles: [
          ModernPlayerSubtitleOptions(
            source: "url_of_subtitle",
            sourceType: ModernPlayerSubtitleSourceType.network,
          ),
        ],
        options: ModernPlayerOptions(
            autoVisibilityPause: true,
            videoStartAt: 5000,
            allowScreenSleep: true), // 自動再生を無効にする
        controlsOptions: ModernPlayerControlsOptions(
          showControls: true,
          doubleTapToSeek: true,
          showMenu: true,
          showMute: true,
          showBackbutton: false,
          enableVolumeSlider: true,
          enableBrightnessSlider: true,
          showBottomBar: true,
          customActionButtons: [
            ModernPlayerCustomActionButton(
              icon: const Icon(
                Icons.info_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _showSnackBar(context, 'インフォメーション');
                });
              },
            ),
          ],
        ),
        // テーマのカスタマイズ
        themeOptions: ModernPlayerThemeOptions(
          backgroundColor: Colors.black,
          menuBackgroundColor: Colors.black,
          loadingColor: Colors.blue,
          menuIcon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          volumeSlidertheme: ModernPlayerToastSliderThemeOption(
            sliderColor: Colors.blue,
            iconColor: Colors.white,
          ),
          // 進行状況スライダーのテーマ
          progressSliderTheme: ModernPlayerProgressSliderTheme(
            activeSliderColor: Colors.blue,
            inactiveSliderColor: Colors.white70,
            bufferSliderColor: Colors.black54,
            thumbColor: Colors.white,
            progressTextStyle: const TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize: 18),
          ),
        ),
        video: ModernPlayerVideo.youtubeWithUrl(
            url:
                'https://www.youtube.com/watch?v=Dpo8hQ-0JYw',
            fetchQualities: true),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
      ),
    );
  }
}
