import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';
import '../models/contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    refreshContactList();
  }

  void refreshContactList() async {
    final allContacts = await DatabaseHelper().getContacts();
    setState(() {
      contacts = allContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (ctx, index) {
          Contact contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            onTap: () {
              // print(contact.name);
              // print(contact);
              Navigator.pushNamed(context, '/view_person', arguments: contact)
                  .then((_) {
                // Callback after returning from ViewPersonScreen
                refreshContactList();
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_person').then((_) {
            // Callback after returning from AddPersonScreen
            refreshContactList();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
