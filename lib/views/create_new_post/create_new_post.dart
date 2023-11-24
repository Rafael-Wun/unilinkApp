import 'package:flutter/material.dart';

class CreateNewPost extends StatefulWidget {
  const CreateNewPost({super.key});

  @override
  State<CreateNewPost> createState() => _CreateNewPostState();
}

class _CreateNewPostState extends State<CreateNewPost> {

  late String _tags;
  List _listTags = [
    "Tarumanagara University",
    "Binus Univeristy"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton (
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                  ),
                  Text(
                    "Create a New Post",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
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
              _buildPost(),
              _desc(),
              _Tags()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPost() {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.fromLTRB(4.0, 4.0, 12.0, 4.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Row(
          children: [
            ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                'https://images.unsplash.com/photo-1487309078313-fad80c3ec1e5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXNpYW4lMjBtZW58ZW58MHx8MHx8fDA%3D',
                width: 40,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _desc() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Tags() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, top: 10, right: 24, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Tags",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  // borderSide: BorderSide(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
