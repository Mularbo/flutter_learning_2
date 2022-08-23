import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Chatty"),
            bottom: const TabBar(tabs: [
              Tab(
                child: Icon(Icons.camera_alt_outlined),
              ),
              Tab(
                child: Text("Chats"),
              ),
              Tab(
                child: Text("Status"),
              ),
              Tab(
                child: Text("Call's"),
              ),
            ]),
            actions: [
              const Icon(Icons.search),
              const SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                icon: Icon(Icons.more_vert_outlined),
                itemBuilder: ((
                  context,
                ) =>
                    const [
                      PopupMenuItem(value: 1, child: Text("New Group")),
                      PopupMenuItem(value: 1, child: Text("Settings"))
                    ]),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: TabBarView(children: [
            Text("Camera"),
            ListView.builder(
              itemBuilder: ((context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://c4.wallpaperflare.com/wallpaper/621/286/348/keanu-reeves-keanu-reeves-parabellum-john-wick-john-wick-hd-wallpaper-preview.jpg"),
                  ),
                  title: Text("Jhon Wick"),
                  subtitle: Text("kesa hai bhai?"),
                  trailing: Text("6:30 pm"),
                );
              }),
              itemCount: 10,
            ),
            Text("Status"),
            ListView.builder(
              itemBuilder: ((context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://c4.wallpaperflare.com/wallpaper/621/286/348/keanu-reeves-keanu-reeves-parabellum-john-wick-john-wick-hd-wallpaper-preview.jpg"),
                  ),
                  title: Text("Jhon Wick"),
                  subtitle: Align(
                      alignment: Alignment.bottomLeft, child: Icon(Icons.call)),
                  trailing: Text("6:30 pm"),
                );
              }),
            )
          ]),
        ));
  }
}
