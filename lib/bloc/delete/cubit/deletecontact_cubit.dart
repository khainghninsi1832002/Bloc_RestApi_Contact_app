import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deletecontact_state.dart';

class DeletecontactCubit extends Cubit<DeletecontactState> {
  DeletecontactCubit() : super(DeletecontactInitial());
}
