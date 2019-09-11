// * For providing data to our VIEWs

import 'dart:async';

import './service/contact_service.dart';
import 'model/contact.dart';

// List<String> CONTACTS = ['User 1', 'User 2', 'User 3', 'User 4'];

class ContactManager {
  Stream<List<Contact>> get contactListNow async* {
    // for (var i = 0; i < CONTACTS.length; i++) {
    //   await Future.delayed(Duration(seconds: 2));
    //   // * yield is the keywords to put something onto the stream.
    //   yield CONTACTS.sublist(0, i + 1);
    // }
    yield await ContactService.browser();
  }

  // * The stream of int (the number of contacts) listen to the CONTACTS stream
  StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;
  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}
