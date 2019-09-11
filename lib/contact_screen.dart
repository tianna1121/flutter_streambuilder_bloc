import 'package:flutter/material.dart';
import 'package:flutter_bloc_streambuilder/contact_manager.dart';

class ContactsScreen extends StatelessWidget {
  ContactManager manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          actions: <Widget>[
            Chip(
              label: StreamBuilder<int>(
                  stream: manager.contactCounter,
                  builder: (context, snapshot) {
                    return Text(
                      (snapshot.data ?? 0).toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  }),
              backgroundColor: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
            )
          ],
        ),
//        drawer: AppDrawer(),
        body: StreamBuilder<List<String>>(
            stream: manager.contactListNow,
            builder: (context, snapshot) {
              // * snapshot hold the CURRENT data in the stream.
              List<String> contacts = snapshot.data;
              return ListView.separated(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contacts[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            }),
      ),
      length: 2,
    );
  }
}
