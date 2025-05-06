import 'package:blocrestapicontactapplication/data/model/contact.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://6819c57b1ac1155635064609.mockapi.io/api/')
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET('')
  Future<List<Contact>> getContact();

  @POST('')
  Future<Contact> addContact(@Body() Contact contact);

  @PUT('{id}')
  Future<Contact> updateContact(@Path() String id, @Body() Contact contact);

  @DELETE('{id}')
  Future<Contact> deleteContact(@Path() String id);
}
