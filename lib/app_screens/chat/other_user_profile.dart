import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/arguments/other_user_profile_arguments.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:provider/provider.dart';

class OtherUserProfile extends StatelessWidget {
  static const routeName = "/profile";

  final String userId;
  // ignore: use_key_in_widget_constructors
  OtherUserProfile({super.key, required this.userId});
  // OtherUserProfile({super.key});

  late User? selectedUser;

  // @override
  @override
  Widget build(BuildContext context) {
    // final OtherUserProfileArguments? args = ModalRoute.of(context)?.settings.arguments as OtherUserProfileArguments?;
    // return CupertinoPageScaffold(
      // child: GestureDetector(
      //   onTap: () {
      //     // Navigator.pushNamed(context, "/chat/${userList.userId}");
      //   },
      //   child: Card(
      //     margin: const EdgeInsets.only(bottom: defaultPadding),
      //     color: deepPurpleAccent,
      //     child: Stack(
      //       clipBehavior: Clip.none,
      //       children: [
      //         _buildUserBackgroundImage(),
      //         _buildUserCardText()
      //       ],
      //     )
      //   )
      // )
    return Consumer<UserProvider>(
      builder: (context, userProfile, _) => CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('UserProfile')
        ),
        child: Card(
          margin: const EdgeInsets.only(bottom: defaultPadding),
          color: deepPurpleAccent,
          child: Column(
            // clipBehavior: Clip.none,
            children: [
              // Show Other User Background Image
              _buildUserBackgroundImage(),

              // Show Other User Profile Image and Name
              _buildUserCardText()

              // Show Chat Button
            ],
          )
        )  
      )
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
            "assets/image/user/sample_user.png",
            // userList.backgroundImage,
            fit: BoxFit.fill
          ) 
        )
      ),
    );
  }

  Widget _buildUserCardText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        TextButton(
          onPressed: () { 
            Navigator.of(context).pop();
          },
          child: const Text('Go back')
        ),
        Text(
          // 'Test',
          selectedUser!.name,
          // userList.userName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          )
        ),
      ],
    );
  }
}