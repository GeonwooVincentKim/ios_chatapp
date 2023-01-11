import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
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
        // child: Card(
        //   margin: const EdgeInsets.only(bottom: defaultPadding),
        //   color: deepPurpleAccent,
        //   // child: Column(
        //   //   // clipBehavior: Clip.none,
        //   //   children: [
        //   //     // Show Other User Background Image
        //   //     _buildUserBackgroundImage(),

        //   //     // Show Other User Profile Image and Name
        //   //     _buildUserCardText()

        //   //     // Show Chat Button
        //   //   ],
        //   // )
        //   // child: Container(
        //   //   decoration: BoxDecoration(
        //   //     image: DecorationImage(
        //   //       image: AssetImage("assets/image/user/sample_user.png"),
        //   //       fit: BoxFit.fitWidth,
        //   //       alignment: Alignment.topCenter,
        //   //     )
        //   //   ),
        //   //   child: Container(
        //   //     child: Column(
        //   //       crossAxisAlignment: CrossAxisAlignment.center,
        //   //       // ignore: prefer_const_literals_to_create_immutables
        //   //       children: [
        //   //         TextButton(
        //   //           onPressed: () { 
        //   //             Navigator.of(context).pop();
        //   //           },
        //   //           child: const Text('Go back')
        //   //         ),
        //   //         Text(
        //   //           // 'Test',
        //   //           selectedUser!.name,
        //   //           // userList.userName,
        //   //           style: TextStyle(
        //   //             fontWeight: FontWeight.bold,
        //   //             color: Colors.white
        //   //           )
        //   //         ),
        //   //       ],
        //   //     )
        //   //   )
            
        //   // ),
        // )  
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset("assets/image/background/bg01.jpg", fit: BoxFit.cover),
            ),
            DraggableScrollableSheet(
              minChildSize: 0.1,
              initialChildSize: 0.22,
              builder:(context, scrollController) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Container(
                    constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                    color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipOval(
                                  child: Image.asset("assets/image/user/sample_user.png", fit: BoxFit.cover)
                                )
                              ),
                              SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Vincent Geonwoo", style: GoogleFonts.roboto(color: Colors.grey[800], fontSize: 36, fontWeight: FontWeight.w700)),
                                    Text("Vincent Geonwoo", style: GoogleFonts.roboto(color: Colors.grey[500], fontSize: 16, fontWeight: FontWeight.w400))
                                    // Text("John Doe", style: TextStyle(color: Colors.grey[800], fontFamily: "Roboto"))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                );
              },
            )
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