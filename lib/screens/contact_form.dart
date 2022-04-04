import 'package:flutter/material.dart';
import 'package:web_api/database/dao/contact_dao.dart';
import 'package:web_api/models/contact.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('Create'),
                  onPressed: () => _creating(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _creating() {
    final String name = _nameController.text;
    final int? accountNumber = int.tryParse(_accountNumberController.text);
    if (accountNumber != null && name.isNotEmpty) {
      final Contact newContact = Contact(id: 0, name: name, accountNumber: accountNumber);
      _dao.save(newContact).then((id) => Navigator.pop(context));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_openSnackbar('Error to try create contact'));
    }
  }

 SnackBar _openSnackbar(String message){
    return SnackBar(
        content: Text(message),
      );
  }
}
