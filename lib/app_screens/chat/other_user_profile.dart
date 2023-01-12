import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/column/box_column_text.dart';
import 'package:ios_chatapp/widgets/custom/draggable/custom_draggable_scrollable_sheet.dart';
import 'package:provider/provider.dart';

class OtherUserProfile extends StatefulWidget {
  final String userId;
  // ignore: use_key_in_widget_constructors
  const OtherUserProfile({super.key, required this.userId});

  @override
  State<OtherUserProfile> createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  late User? selectedUser;

  @override
  void initState() {
    setState(() {
      selectedUser = Provider.of<UserProvider>(context, listen: false).getSingleUser;
    });

    if (selectedUser == null) {
      final List<User> userList = Provider.of<UserProvider>(context, listen: false).filteredUsers.toList();
      selectedUser = userList.firstWhere((user) => user.userId == widget.userId);
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Show other User Background Image
            _buildProfileBackground(context),

            // Backbutton
            _buildProfileBackButton(context),

            // Show other User name and status and ChatButton
            CustomDraggableScrollableSheet(selectedUser: selectedUser),

            // Show other User Profile picture
            _buildProfileImage(context)
          ],
        )
      )
    );
  }

  Positioned _buildProfileBackButton(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / defaultPadding,
      left: MediaQuery.of(context).size.width / defaultPadding,
      // child: const CircleAvatar(
      //   radius: backButtonCircleAvatar,
      //   backgroundColor: transparentColor,
      //   foregroundColor: Colors.white70,
      //   child: ClipOval(
      //     child: Icon(Icons.arrow_back)
      //   )
      // )
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   shape: const CircleBorder(),
        //   backgroundColor: transparentColor,
        //   disabledForegroundColor: transparentColor,
        //   disabledBackgroundColor: transparentColor,
        //   elevation: 0,
        //   shadowColor: transparentColor,
        //   splashFactory: NoSplash.splashFactory
        // ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(transparentColor),
          overlayColor: MaterialStateProperty.all(transparentColor),
          shadowColor: MaterialStateProperty.all(transparentColor)
        ),
        child: const Icon(Icons.arrow_back),
        // child: const Icon(CupertinoIcons.arrow_left, color: white70),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    );
  }

  SizedBox _buildProfileBackground(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset("assets/image/background/bg01.jpg", fit: BoxFit.cover),
    );
  }

  Positioned _buildProfileImage(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.5,
      bottom: MediaQuery.of(context).size.height * 0.12,
      child: CircleAvatar(
        radius: profileCircleAvatar,
        child: ClipOval(
          child: Image.asset("assets/image/user/sample_user.png", fit: BoxFit.cover)
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
