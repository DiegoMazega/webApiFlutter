import 'package:web_api/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction({
    required this.value,
    required this.contact,
  }
  );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

}