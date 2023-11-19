import 'package:flutter/material.dart';
import 'package:unilink_project/view/profile/wdget/photos_grid.dart';
import 'package:unilink_project/view/profile/wdget/post_grid.dart';
import 'package:unilink_project/view/profile/wdget/togged_grid.dart';
import 'package:unilink_project/view/profile/wdget/videos_grid.dart';
import '../../main.dart';
import 'edit_profil.dart';

class OtherProfileView extends StatefulWidget {
  const OtherProfileView({super.key});

  @override
  State<OtherProfileView> createState() => _OtherProfileViewState();
}

class _OtherProfileViewState extends State<OtherProfileView> {
  final List<Widget> tabs = const [
    Tab(
      // icon: Icon(
      //   Icons.grid_on_sharp,
      //   color: Colors.grey,
      // ),
      text: 'All',
    ),
    Tab(
      text: 'Posts',
    ),
    Tab(
      text: 'Photos',
    ),
    Tab(
      text: 'Videos',
    ),
  ];

  final List<Widget> tabBarViews = const [
    PostGrid(),
    TaggedGrid(),
    PhotosGrid(),
    VideosGrid(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              _buildProfileTop(),
              SizedBox(
                height: 10,
              ),
              _buildProfile(),
              SizedBox(
                height: 8,
              ),
              TabBar(
                tabs: tabs,
                // indicatorColor: Colors.secondaryColor,
              ),
              SizedBox(
                height: 640,
                child: TabBarView(
                  children: tabBarViews,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
          // top: deviceHeight * .125,
          child: buildAvatar(),
        ),
      ],
    );
  }

  Widget buildCoverImage() {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        'assets/images/moraine.jpg',
        // width: deviceWidth,
        // height: deviceHeight * .2,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildAvatar() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 64,
        ),
      ],
    );
  }

  Widget _buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          // '${currentUser.fName} ' + '${currentUser.lName}',
          'Hen Lix',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          // 'Student of ' + '${currentUser.univ}' + ' University',
          'Student of Tarumanagara Univeristy',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditProfile();
            }));
          },
          child: Container(
            color: Colors.white38,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Designer',
                style: TextStyle(
                    // backgroundColor: Colors.grey,
                    fontSize: 16
                 ),
                textAlign: TextAlign.center,
              ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        // _buildFollow(),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void dummy() {
    return;
  }

// Widget _buildFollow() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       TextButton(
//         onPressed: dummy,
//         child: Text(
//           '${currentUser.followers} Followers',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       TextButton(
//         onPressed: dummy,
//         child: Text(
//           '${currentUser.following} Following',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//     ],
//   );
// }
}

