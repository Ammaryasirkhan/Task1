import 'package:flutter/material.dart';
import 'package:task_1_to_do_list_app/Classes/dimensions.dart';
import 'package:task_1_to_do_list_app/Widgets/big_text.dart';

import '../Classes/colors.dart';
import '../Widgets/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: ColorRes.app,
            borderRadius: BorderRadius.circular(Dimensions.height30),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 5,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: Dimensions.height30),
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height30, vertical: Dimensions.height20),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/codesoft.png',
                  height: Dimensions.height40,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/images/p.png'),
                //   radius: Dimensions.height40,
                // ),
                SizedBox(width: Dimensions.height15),
                BigText(
                  text: "Hello CODSOFT",
                ),
              ],
            ),
          ),
          // Adjust the spacing between the image and text

          SizedBox(
              height: Dimensions
                  .height20), // Adjust the spacing between the name and links
          Column(
            children: <Widget>[
              ImageTextCard(
                text: "Ammar Yasir Khan",
                image: AssetImage('assets/images/link.png'),
              ),
              ImageTextCard(
                text: "ammaryasirniazi567@gmail.com",
                image: AssetImage('assets/images/email.png'),
              ),
              ImageTextCard(
                text: "Ammaryasirkhan",
                image: AssetImage('assets/images/git.png'),
              ),
              ImageTextCard(
                text: "03436158563",
                image: AssetImage('assets/images/c.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
