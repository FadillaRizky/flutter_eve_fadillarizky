import 'package:flutter/material.dart';
import 'package:flutter_eve_fadillarizky/constants.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class ProfilePage extends StatelessWidget {

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: Image.asset("assets/logo.png"),
        actions: [
          IconButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Color(0xff398d42)),
                  backgroundColor: MaterialStateProperty.all(Color(0x698becd0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))))),
              onPressed: () {
              },
              icon: Icon(Icons.settings)),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0x698becd0),
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Icon(Icons.more_vert,color: Color(0xff398d42),)),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Text('Log Out'),
              ),
            ],
            onSelected: (item) {
              switch (item) {
                case "logout":
                  controller.signOutGoogle();

              }
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: Image
                            .network(controller.photourl.value)
                            .image,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return Text(
                      controller.username.value,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text("12", style: Constants.subtitle2),
                        Text(
                          "Fundraising",
                          style: Constants.subtitle2,
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text("493", style: Constants.subtitle2),
                        Text(
                          "Followers",
                          style: Constants.subtitle2,
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Text("126", style: Constants.subtitle2),
                        Text(
                          "Following",
                          style: Constants.subtitle2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0x698becd0)),
                      child: Image.asset(
                        "assets/icon_wallet.png",
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$123",
                            style: Constants.subtitle1,
                          ),
                          Text(
                            "My wallet balance",
                            style:
                            TextStyle(color: Colors.black38, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(color: Color(0xff398d42))),
                            foregroundColor:
                            MaterialStateProperty.all(Colors.green)),
                        onPressed: () {},
                        child: Text("Top up"))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tristique, eros quis varius imperdiet, sem mauris accumsan nisl. ",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Interest",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.edit,
                  color: Color(0xff398d42),
                )
              ],
            ),
            Row(
              children: [
                InterestChild(
                  title: 'Medical',
                ),
                InterestChild(title: "Disaster"),
                InterestChild(title: "Education"),
                InterestChild(title: "Social"),
              ],
            ),
            Row(
              children: [
                InterestChild(
                  title: 'Orphanage',
                ),
                InterestChild(title: "Humanity"),
                InterestChild(title: "Environment"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InterestChild extends StatelessWidget {
  final String title;

  const InterestChild({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color(0xff398d42), width: 1.5)),
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(3),
      child: Text(
        title,
        style: TextStyle(color: Color(0xff398d42)),
      ),
    );
  }
}
