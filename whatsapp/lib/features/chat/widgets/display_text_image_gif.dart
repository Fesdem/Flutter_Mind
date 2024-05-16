import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/enums/message_enum.dart';
import 'package:whatsapp_ui/features/chat/widgets/video_player_item.dart';
import 'package:audioplayers/audioplayers.dart';

class DisplayTextImageGif extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const DisplayTextImageGif({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final AudioPlayer audioPlayer = AudioPlayer();
    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.audio
            ? StatefulBuilder(
              builder: (context, SetState) {
                return IconButton(
                    constraints: BoxConstraints(
                      minWidth: 100,
                    ),
                    onPressed: () async {
                      if(isPlaying) {
                        await audioPlayer.pause(); 
                        SetState (() {
                          isPlaying = false;
                        });
                      } else {
                        await audioPlayer.play(UrlSource(message));
                         SetState (() {
                          isPlaying = true;
                        });
                      }
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause_circle : Icons.play_circle,
                    ),
                  );
              }
            )
            : type == MessageEnum.video
                ? VideoPlayerItem(
                    videoUrl: message,
                  )
                : type == MessageEnum.gif
                    ? CachedNetworkImage(
                        imageUrl: message,
                      )
                    : CachedNetworkImage(
                        imageUrl: message,
                      );
  }
}
