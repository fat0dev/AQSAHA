import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvater extends StatelessWidget {
  final String imageUrl;
  final bool? isActive;
  final bool? hasBorder;
  const ProfileAvater({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.teal,
          child: CircleAvatar(
            radius: hasBorder! ? 17.0 : 20.0,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),

        ),
        isActive! 
        ? Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            height: 15.0,
            width: 15.0,
            decoration: BoxDecoration(
              color: Colors.tealAccent,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Colors.white
              ),
            ),
          ),
        )
        : const SizedBox.shrink()
      ],
    );
  }
}