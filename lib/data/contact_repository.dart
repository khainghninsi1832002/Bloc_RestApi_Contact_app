import 'package:blocrestapicontactapplication/data/api/api_service.dart';
import 'package:blocrestapicontactapplication/data/model/contact.dart';

class ContactRepository {
  final ApiService _ApiService;
  ContactRepository(this._ApiService);

  Future<List<Contact>> getContact() => _ApiService.getContact();

  Future<Contact> addContact(Contact contact) =>
      _ApiService.addContact(contact);

  Future<Contact> updateContact(String id, Contact contact) =>
      _ApiService.updateContact(id, contact);

  Future<Contact> deleteContact(String id) => _ApiService.deleteContact(id);
}
