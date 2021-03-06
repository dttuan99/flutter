import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../actionbtn.dart';
import '../feedbox.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zalo Clone",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 3;
  Color bgBlack = Color(0xFF1a1a1a);
  Color mainBlack = Color(0xFF262626);
  Color fbBlue = Color(0xFF2D88FF);
  Color mainGrey = Color(0xFF505050);

  //Here I'm going to import a list of images that we will use for the profile picture and the storys
  List<String> avatarUrl = [
    "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1525879000488-bff3b1c387cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  ];
  List<String> storyUrl = [
    "https://images.unsplash.com/photo-1600055882386-5d18b02a0d51?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=621&q=80",
    "https://images.unsplash.com/photo-1600174297956-c6d4d9998f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1600008646149-eb8835bd979d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=666&q=80",
    "https://images.unsplash.com/photo-1502920313556-c0bbbcd00403?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80",
  ];

  List<String> videoUrls = [
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
    'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: ListTile(
          //contentPadding: const EdgeInsets.only(top: 0.0, left: 2.0),
          title: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'T??m b???n b??, tin nh???n...',
                hintStyle: TextStyle(color: Colors.white)),
            onChanged: (text) {
              print(text);
            },
          ),
          leading: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.broken_image_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              size: 30,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(avatarUrl[0]),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5.0),
                              hintText: "H??m nay b???n th??? n??o?",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 0.5,
                  ),
                  Row(
                    children: [
                      actionButton(
                          Icons.photo, "????ng h??nh", Colors.lightGreen, MediaQuery.of(context).size.width * 0.06),
                      actionButton(Icons.videocam, "????ng video",
                          Colors.pinkAccent, MediaQuery.of(context).size.width * 0.06),
                      actionButton(Icons.color_lens, "H??nh n???n",
                          Colors.purpleAccent, MediaQuery.of(context).size.width * 0.06),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          feedBox(avatarUrl[0], "????o Minh Tu???n", "6 min",
              "Sao minh ?????p trai th??? nh???", [], [videoUrls[0]]),
          feedBox(avatarUrl[2], "Nguy???n Qu?? Ph??c", "Yesterday",
              "Anh Tu???n l?? s?? ph??? c???a em", [storyUrl[2]], [videoUrls[1]]),
          feedBox(avatarUrl[1], "Mai Thu Trang", "6 min", "Y??u anh Tu???n v??i",
              [storyUrl[2], storyUrl[0], storyUrl[1]], []),
          feedBox(avatarUrl[1], "Mai Thu Trang", "6 min", "Y??u anh Tu???n v??i",
              [storyUrl[2], storyUrl[2]], []),
          feedBox(avatarUrl[2], "Nguy???n Qu?? Ph??c", "Yesterday",
              "Anh Tu???n l?? s?? ph??? c???a em", [storyUrl[2]], []),
          feedBox(avatarUrl[1], "Mai Thu Trang", "6 min", "Y??u anh Tu???n v??i",
              [storyUrl[2], storyUrl[0], storyUrl[1]], []),
          feedBox(avatarUrl[1], "Mai Thu Trang", "6 min", "Y??u anh Tu???n v??i",
              [storyUrl[2], storyUrl[0], storyUrl[1], storyUrl[0]], []),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
              size: 30,
            ),
            label: "Tin nh???n",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined, size: 30),
            label: "Danh b???",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_rounded, size: 30),
            label: "Nh??m",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined, size: 30),
            label: "Nh???t k??",
            //backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all_rounded, size: 30),
            label: "Th??m",
            //backgroundColor: Colors.blue
          )
        ],
        onTap: (value) {
          // Respond to item press.
          setState(() => _currentIndex = value);
        },
      ),
    );
  }
}
