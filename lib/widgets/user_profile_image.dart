import 'package:club_house/data.dart';
import 'package:flutter/material.dart';

class UserProfilImage extends StatelessWidget {
  final double size;
  final String imageUrl;

  const UserProfilImage({Key? key, required this.size, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 10),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: size,
        height: size,
      ),
    );
  }
}
