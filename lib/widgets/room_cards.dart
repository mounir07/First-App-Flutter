import 'package:club_house/models/rooms.dart';
import 'package:club_house/screens/Room_Screen.dart';
import 'package:club_house/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => RoomScreen(
          room: room,
        ),
      )),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${room.club} 🏠 ".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(fontSize: 12.0, fontWeight: FontWeight.w400),
                ),
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            UserProfilImage(
                                size: 40.0,
                                imageUrl: room.speakers[0].imageURL),
                            Positioned(
                              left: 22,
                              top: 25,
                              child: UserProfilImage(
                                  size: 40.0,
                                  imageUrl: room.speakers[1].imageURL),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...room.speakers.map((e) => Text(
                                  "${e.firstName} ${e.lastName} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline
                                      ?.copyWith(
                                        fontSize: 16.0,
                                      ))),
                              SizedBox(height: 8.0),
                              Text.rich(TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "  ${room.speakers.length + room.followedBySpeakers.length + room.others.length} ",
                                  ),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.person,
                                    size: 15,
                                    color: Colors.grey[900],
                                  )),
                                  TextSpan(
                                    text: " / ${room.speakers.length} ",
                                  ),
                                  WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.chat_bubble,
                                    size: 15,
                                    color: Colors.grey[900],
                                  ))
                                ],
                              ))
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
