import 'package:bloc/bloc.dart';
import 'package:blocrestapicontactapplication/data/contact_repository.dart';
import 'package:blocrestapicontactapplication/data/model/contact.dart';
import 'package:equatable/equatable.dart';
part 'getcontact_state.dart';

class GetcontactCubit extends Cubit<GetcontactState> {
  final ContactRepository _contactRepository;
  GetcontactCubit(this._contactRepository) : super(GetcontactInitial());

  void getContact() {
    emit(GetcontactInitial());
    _contactRepository
        .getContact()
        .then((value) => emit(GetcontactSuccess(value)))
        .catchError((e) => emit(GetcontactFail('Error')));
  }
}
