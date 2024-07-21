import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../helpers/database_helper.dart';

class EditPersonScreen extends StatefulWidget {
  // final Contact contact;

  // EditPersonScreen(this.contact);

  @override
  _EditPersonScreenState createState() => _EditPersonScreenState();
}

class _EditPersonScreenState extends State<EditPersonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  int? _id;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Contact;

    _nameController.text = arguments.name;
    _phoneNumberController.text = arguments.phoneNumber;
    _id = arguments.id;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Person'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedContact = Contact(
                      id: _id,
                      name: _nameController.text,
                      phoneNumber: _phoneNumberController.text,
                    );
                    DatabaseHelper().updateContact(updatedContact).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Update Person'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
