import 'package:flutter/material.dart';
import '../models/contact.dart';

class ViewPersonScreen extends StatefulWidget {
  // const ViewPersonScreen({super.key});

  @override
  State<ViewPersonScreen> createState() => _ViewPersonScreenState();
}

class _ViewPersonScreenState extends State<ViewPersonScreen> {
  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: Text('View Person'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${contact.name}'),
            SizedBox(height: 10),
            Text('Phone Number: ${contact.phoneNumber}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/edit_person', arguments: contact);
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
