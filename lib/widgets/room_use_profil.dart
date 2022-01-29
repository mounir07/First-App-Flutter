import 'package:club_house/data.dart';
import 'package:club_house/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String name;
  final bool isMuet;
  final bool isNew;

  const RoomUserProfile(
      {Key? key,
      required this.imageUrl,
      this.size = 40,
      required this.name,
      this.isMuet = false,
      this.isNew = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Padding(
            padding: EdgeInsets.all(6.0),
            child: UserProfilImage(
              size: size,
              imageUrl: imageUrl,
            ),
          ),
          if (isNew)
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ]),
                child: Text(
                  "🎈",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          if (isMuet)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ]),
                child: Icon(CupertinoIcons.mic_slash_fill),
              ),
            ),
        ]),
        Flexible(
            child: Text(
          name,
          overflow: TextOverflow.ellipsis,
        ))
      ],
    );
  }
}
