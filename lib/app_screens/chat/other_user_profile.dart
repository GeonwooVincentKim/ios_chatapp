import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:provider/provider.dart';

class OtherUserProfile extends StatefulWidget {
  static const routeName = '/profile';

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
    return CupertinoPageScaffold(
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
      child: Card(
        margin: const EdgeInsets.only(bottom: defaultPadding),
        color: deepPurpleAccent,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Show Other User Background Image
            _buildUserBackgroundImage(),

            // Show Other User Profile Image and Name
            _buildUserCardText()

            // Show Chat Button
          ],
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