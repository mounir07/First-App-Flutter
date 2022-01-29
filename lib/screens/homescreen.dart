import 'package:club_house/data.dart';
import 'package:club_house/widgets/room_cards.dart';
import 'package:club_house/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 28,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                size: 30,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_today,
                size: 28,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 28,
                color: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: UserProfilImage(size: 34, imageUrl: currentUser.imageURL),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
            children: [
              ...roomList.map((e) => RoomCard(room: e)),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ))),
          ),
          Positioned(
            bottom: 50,
            left: 70,
            right: 70,
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.add,
                  size: 25,
                  color: Colors.white,
                ),
                label: Text(
                  'Add a Room',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  primary: Theme.of(context).accentColor,
                )),
          ),
        ],
      ),
    );
  }
}
