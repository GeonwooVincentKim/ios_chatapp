import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/shared/style.dart';

class OtherUserProfile extends StatefulWidget {
  const OtherUserProfile({super.key});

  @override
  State<OtherUserProfile> createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, "/chat/${userList.userId}");
        },
        child: Card(
          margin: const EdgeInsets.only(bottom: defaultPadding),
          color: deepPurpleAccent,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _buildUserBackgroundImage(),
              _buildUserCardText()
            ],
          )
        )
      )
      // child: Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       // Show Other User Background Image
      //       Container(
              
      //       ),

      //       // Show Other User Profile Image and Name
      //       Container(

      //       ),

      //       // Show Chat Button
      //     ],
      //   )
      // ),
    );
  }

  Widget _buildUserBackgroundImage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(generalBorder),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image.asset(
            "",
            // userList.backgroundImage,
            fit: BoxFit.fill
          ) 
        )
      ),
    );
  }

  Widget _buildUserCardText() {
    return Positioned(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            'Test',
            // userList.userName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          ),
        ],
      )
    );
  }
}