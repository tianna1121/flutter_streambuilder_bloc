import 'package:flutter/material.dart';
import './contact_manager.dart';
import 'model/contact.dart';

class ContactsScreen extends StatelessWidget {
  ContactManager manager = ContactManager();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          actions: <Widget>[
            StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Chip(
                      backgroundColor: Colors.red,
                      label: Text(
                        (snapshot.data ?? 0).toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ));
                }),
            Padding(
              padding: const EdgeInsets.only(right: 16),
            )
          ],
        ),
//        drawer: AppDrawer(),
        body: StreamBuilder(
            stream: manager.contactListNow,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // * check the connection states
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:

                  // * snapshot hold the CURRENT data in the stream.
                  List<Contact> contacts = snapshot.data;
                  return ListView.separated(
                    itemCount: contacts?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Contact _contact = contacts[index];
                      return ListTile(
                        title: Text(_contact.name),
                        leading: CircleAvatar(),
                        subtitle: Text(_contact.email),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                  );
              }
            }),
      ),
      length: 2,
    );
  }
}
