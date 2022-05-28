import 'package:flutter/material.dart';
import 'package:whatsapp/status_list.dart';
import 'calls_list.dart';
import 'camara.dart';
import 'contacts_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    //inicializando tabController
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    //metodo dipose tabController
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabBar tabBar = TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
          icon: Icon(Icons.camera_alt),
        ),
        Tab(
          text: "CHATS",
        ),
        Tab(
          text: "ESTADOS",
        ),
        Tab(
          text: "LLAMADAS",
        ),
      ],
      isScrollable: true,
    );
    AppBar appBar = AppBar(
      title: const Text("Whatsapp"),
      backgroundColor: Colors.green.shade800,
      bottom: tabBar,
      actions: const <Widget>[
        Icon(Icons.search),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
        Icon(Icons.more_vert),
      ],
    );

    TabBarView tabBarview = TabBarView(
      controller: _tabController,
      children: <Widget>[
        Camara(),
        ContactList(),
        StatusScreen(),
        CallScreen(),
      ],
    );

    floatingActionButton(Icon icon) {
      return FloatingActionButton(
        onPressed: () {},
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).accentColor,
        child: icon,
      );
    }

    Widget floatingActionButtonStatus(Icon iconEdit, Icon iconCamera) {
      return Column(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {},
            foregroundColor: const Color(0xff49646c),
            backgroundColor: const Color(0xffebf4fc),
            child: iconEdit,
          ),
          const SizedBox(
            height: 10,
          ),
          floatingActionButton(iconCamera)
        ],
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
      );
    }

    return Scaffold(
      appBar: appBar,
      body: tabBarview,
      floatingActionButton: _tabController.index == 0
          ? Container()
          : _tabController.index == 1
              ? floatingActionButton(const Icon(Icons.message))
              : _tabController.index == 2
                  ? floatingActionButtonStatus(
                      const Icon(Icons.edit), const Icon(Icons.camera_alt))
                  : floatingActionButton(const Icon(Icons.add_call)),
    );
  }
}
