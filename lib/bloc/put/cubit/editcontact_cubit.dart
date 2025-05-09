import 'package:bloc/bloc.dart';
import 'package:blocrestapicontactapplication/data/contact_repository.dart';
import 'package:blocrestapicontactapplication/data/model/contact.dart';
import 'package:equatable/equatable.dart';

part 'editcontact_state.dart';

class EditcontactCubit extends Cubit<EditcontactState> {
  final ContactRepository _contactRepository;
  EditcontactCubit(this._contactRepository) : super(EditcontactInitial());

  void edit(String id, Contact contact) {
    emit(EditcontactLoading());
    _contactRepository
        .updateContact(id, contact)
        .then((value) => emit(EditcontactSuccess()))
        .catchError((e) => emit(EditcontactFail('Error')));
  }
}
