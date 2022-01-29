import 'dart:math';

import 'package:club_house/data.dart';
import 'package:club_house/models/rooms.dart';
import 'package:club_house/widgets/room_cards.dart';
import 'package:club_house/widgets/room_use_profil.dart';
import 'package:club_house/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.chevron_down,
          ),
          label: Text('Halway'),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.doc,
                size: 28,
                color: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: UserProfilImage(size: 34, imageUrl: currentUser.imageURL),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.white),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${room.club} 🏠 ".toUpperCase(),
                        style: Theme.of(context).textTheme.overline?.copyWith(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        ?.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                          isMuet: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Folowed By Speakers',
                style: Theme.of(context).textTheme.overline?.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15.0,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others',
                style: Theme.of(context).textTheme.overline?.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15.0,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageUrl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 50)),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Leave Quitly 👌',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    padding: EdgeInsets.all(6),
                    child: Icon(CupertinoIcons.hand_raised),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
