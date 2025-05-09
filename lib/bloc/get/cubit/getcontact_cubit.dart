import 'package:bloc/bloc.dart';
import 'package:blocrestapicontactapplication/data/contact_repository.dart';
import 'package:blocrestapicontactapplication/data/model/contact.dart';
import 'package:equatable/equatable.dart';
part 'getcontact_state.dart';

class GetcontactCubit extends Cubit<GetcontactState> {
  final ContactRepository _contactRepository;
  GetcontactCubit(this._contactRepository) : super(GetcontactInitial()) {
    getContact();
  }

  void getContact() {
    emit(GetcontactInitial());
    _contactRepository
        .getContact()
        .then((value) => emit(GetcontactSuccess(value)))
        .catchError((e) => emit(GetcontactFail('Error')));
  }

  void delete(String id) {
    emit(GetcontactInitial());
    _contactRepository
        .deleteContact(id)
        .then((value) => getContact())
        .catchError((e) => emit(GetcontactFail('Cannot Delete')));
  }
}
