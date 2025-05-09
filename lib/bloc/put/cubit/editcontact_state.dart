part of 'editcontact_cubit.dart';

sealed class EditcontactState extends Equatable {
  const EditcontactState();

  @override
  List<Object> get props => [];
}

final class EditcontactInitial extends EditcontactState {}

class EditcontactLoading extends EditcontactState {}

class EditcontactSuccess extends EditcontactState {}

class EditcontactFail extends EditcontactState {
  final String error;
  EditcontactFail(this.error);

  @override
  List<Object> get props => [error];
}
