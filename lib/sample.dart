import 'package:flutter/material.dart';

import 'Color.dart';

class Sample extends StatelessWidget {
  List<int> idArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#E5E5E5'),
      extendBody:
          true, // Important: to remove background of bottom navigation (making the bar transparent doesn't help)
      bottomNavigationBar: BottomBar(),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 75),
          child: Column(
            children: [for (int i in idArray) AppBody(i)],
          ),
        ),
      ),
    );
  }

  Column AppBody(int img) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          padding: const EdgeInsets.all(5.0),
          // height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400, width: 2)),
          child: Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('img/images1.jpeg'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Health Partners',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18)),
                          SizedBox(height: 5),
                          Text('2 hours ago',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                      'Vitae viverra auctor id ac lobortis amet molestie lacus. Tempor nec proin lacus Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. end',
                      style: TextStyle(fontSize: 15)),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160.0,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://source.unsplash.com/random/300x200?v=${img}")),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 15, bottom: 15),
                        width: 83,
                        height: 46,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23),
                          ),
                          elevation: 2,
                          color: Colors.green.shade300,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ), // add space at the bottom due to extendBody property for proper scrolling
      ],
    );
  }

  PreferredSize MyAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: Center(
          child: AppBar(
        elevation: 0,
        toolbarHeight: 100, // Set this height
        flexibleSpace: Container(
          alignment: Alignment.bottomCenter,
          color: HexColor('#E5E5E5'),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('img/background.jpg'),
                ),
                Spacer(),
                Icon(Icons.mail_outline_outlined),
                SizedBox(width: 15),
                Icon(Icons.notification_add_outlined),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('img/images2.jpeg'),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed, // Fixed
              backgroundColor: Colors.white, // <-- This works for fixed
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Bulletin Board'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Services'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'My Todo'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Actions'),
              ],
            ),
          )),
    );
  }
}
