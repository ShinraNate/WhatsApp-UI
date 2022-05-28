import 'package:flutter/material.dart';
import 'info.dart';
import 'colors.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            info[index]['name'].toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              info[index]['message'].toString(),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                info[index]['profilePic'].toString()),
                          ),
                          trailing: Text(
                            info[index]['time'].toString(),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  );
                }),
          ),
          const Divider(
            color: dividerColor,
            indent: 85,
          ),
        ],
      ),
    );
  }
}
