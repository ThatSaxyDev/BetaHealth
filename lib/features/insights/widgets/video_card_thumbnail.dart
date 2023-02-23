// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';
// import 'dart:io';

// import 'package:chewie/chewie.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

// class VideoCardThumbNail extends StatefulWidget {
//   final String videoUrl;

//   const VideoCardThumbNail({
//     Key? key,
//     required this.videoUrl,
//   }) : super(key: key);

//   @override
//   State<VideoCardThumbNail> createState() => _VideoCardThumbNailState();
// }

// class _VideoCardThumbNailState extends State<VideoCardThumbNail> {
//   // String VIDEO_ONE =
//   //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
//   late VideoPlayerController videoPlayerController1;
//   late ChewieController _chewieController1;
//   Uint8List? imageBytes;
//   @override
//   void initState() {
//     _generateThumbnail();
//     initializePlayer();
//     log(widget.videoUrl);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     videoPlayerController1.dispose();
//     _chewieController1.dispose();
//     super.dispose();
//   }

//   _generateThumbnail() async {
//     String? fileName = await VideoThumbnail.thumbnailFile(
//       video: widget.videoUrl,
//       thumbnailPath: (await getTemporaryDirectory()).path,
//       imageFormat: ImageFormat.PNG,
//       maxHeight: 350,
//       quality: 75,
//     );
//     final file = File(fileName!);
//     imageBytes = file.readAsBytesSync();
//     print('----image--->>>$fileName');
//     setState(() {});
//   }

//   Future<void> initializePlayer() async {
//     if (mounted) {
//       videoPlayerController1 = VideoPlayerController.network(widget.videoUrl);
//       await videoPlayerController1.initialize();
//       _createChewieController();
//       setState(() {});
//     }
//   }

//   _createChewieController() {
//     _chewieController1 = ChewieController(
//       videoPlayerController: videoPlayerController1,
//       aspectRatio: videoPlayerController1.value.aspectRatio,
//       autoPlay: false,
//       looping: true,
//       allowFullScreen: true,
//       allowedScreenSleep: false,
//       autoInitialize: true,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 163.w,
//       margin: EdgeInsets.only(right: 13.w),
//       child: Expanded(
//         child: Center(
//           child: Stack(
//             children: [
//               Image.memory(
//                 imageBytes!,
//                 height: 100.h,
//                 width: 163.w,
//               ),
//               const Align(
//                 alignment: Alignment.center,
//                 child: ClipOval(
//                   child: Material(
//                     color: Colors.white, // Button color
//                     child: SizedBox(
//                         width: 56, height: 56, child: Icon(Icons.play_arrow)),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
