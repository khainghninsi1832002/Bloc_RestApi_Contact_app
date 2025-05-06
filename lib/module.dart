//Service locator file
import 'package:blocrestapicontactapplication/bloc/get/cubit/getcontact_cubit.dart';
import 'package:blocrestapicontactapplication/data/api/api_service.dart';
import 'package:blocrestapicontactapplication/data/contact_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.I;
void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() =>
      dio); //မလိုအပ်သေးပဲ objectကို createလုပ်စရာမလို request lout ma create lout mar

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);
  ContactRepository contactRepository = ContactRepository(getIt.call());
  getIt.registerLazySingleton(() => contactRepository);

  //UI cubitထည့်ခင်လို့ dမာ အရင်ရေးရတာ
  GetcontactCubit getcontactCubit = GetcontactCubit(getIt.call());
  getIt.registerLazySingleton(() => getcontactCubit);
}
