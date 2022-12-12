import 'package:audioplayers/audioplayers.dart';
import 'package:dr_magz/preferences.dart';

AudioPlayer player = AudioPlayer();
MusicPreference musicPreference = MusicPreference();
Future<void> playMusic() async {
  // player.play(AssetSource("audios/backsound.mpeg"));
  if (await musicPreference.getMusic()) {
    await player.setSourceAsset("audios/backsound.mp3");
    player.setReleaseMode(ReleaseMode.loop);
    await player.resume();
    // musicPreference.setMusic(true);
  } else {
    player.release();
  }
  // await player.setSourceAsset("assets/audios/backsound.mpeg");
}
