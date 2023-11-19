import 'package:flutter/material.dart';
import '../../main.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfile> {
  final List<Widget> tabs = const [
    Tab(
      icon: Icon(
        Icons.grid_on_sharp,
        color: Colors.grey,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.tag_faces,
        color: Colors.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.brown,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton (
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                  Text(
                    "Edit Akun",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              _buildProfileTop(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _displayname(),
                    _university(),
                    _Aboutme(),
                    _accom(),
                    _Email(),
                    _Password(),
                    SizedBox(
                      height: 24.0,
                    ),
                    _Logout(),
                  ],
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
          top: 20,
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
        //  height: deviceHeight * .2,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildAvatar() {
    return Column(
      children: [
        CircleAvatar(
          // backgroundImage: NetworkImage('${currentUser.avatar}'),
          radius: 64,
        ),
      ],
    );
  }
}

Widget _displayname() {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          decoration: InputDecoration(labelText: 'Display Name'),
          onChanged: (value) {
            // Logika saat teks berubah
          },
        ),
      ),
      IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          // Logika saat tombol edit ditekan
        },
      ),
    ],
  );
}

Widget _university() {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          decoration: InputDecoration(labelText: 'University'),
          onChanged: (value) {},
        ),
      ),
      IconButton(
        icon: Icon(Icons.check),
        onPressed: () {},
      ),
    ],
  );
}

Widget _Aboutme() {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          decoration: InputDecoration(labelText: 'About Me'),
          onChanged: (value) {},
        ),
      ),
      IconButton(
        icon: Icon(Icons.check),
        onPressed: () {},
      ),
    ],
  );
}

Widget _accom() {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          decoration: InputDecoration(labelText: 'Accomplishment'),
          onChanged: (value) {},
        ),
      ),
      IconButton(
        icon: Icon(Icons.check),
        onPressed: () {},
      ),
    ],
  );
}

Widget _Email() {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          decoration: InputDecoration(labelText: 'Email'),
          onChanged: (value) {
            // Logika saat teks berubah
          },
        ),
      ),
      IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          // Logika saat tombol edit ditekan
        },
      ),
    ],
  );
}

Widget _Password() {
  return Row(
    children: <Widget>[
      Expanded(
        child: TextField(
          decoration: InputDecoration(labelText: 'Password'),
          onChanged: (value) {
            // Logika saat teks berubah
          },
        ),
      ),
      IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          // Logika saat tombol edit ditekan
        },
      ),
    ],
  );
}

Widget _Logout() {
  return ElevatedButton(
    onPressed: () {
      _Logout();
    },
    child: Text('Log Out'),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      backgroundColor: Colors.red,
      padding: EdgeInsets.fromLTRB(56, 14, 56, 14),
    ),
  );
}
