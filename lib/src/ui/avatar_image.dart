import 'package:flutter/material.dart';

import 'package:image_fade/image_fade.dart';

class AvatarImage extends StatelessWidget {
  final String? url;

  const AvatarImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ImageFade(
          duration: const Duration(milliseconds: 150),
          image: NetworkImage(url!),
          placeholder: const AvatarPlaceholder(),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const AvatarPlaceholder();
    }
  }
}

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: const SizedBox(
        width: 10,
        height: 10,
        child: Center(child: Icon(Icons.person)),
      ),
    );
  }
}
