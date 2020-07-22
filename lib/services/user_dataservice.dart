import './rest_service.dart';
import '../models/profile.dart';

class UserDataService{
  static final UserDataService _instance = UserDataService._constructor();
  factory UserDataService() {
    return _instance;
  }

  UserDataService._constructor();
  final rest = RestService();

  Future<List<Profile>> getAllUsers() async {
    final listJson = await rest.get('users');

    return (listJson as List)
        .map((itemJson) => Profile.fromJson(itemJson))
        .toList();
  }

  Future deleteUser({String id}) async {
    await rest.delete('users/$id');
  }

  Future<Profile> createQuote({Profile user}) async {
    final json = await rest.post('users', data: user);
    return Profile.fromJson(json);
  }

  Future<Profile> getUser({String id}) async {
    final json = await rest.get('users/$id');

    return Profile.fromJson(json);
  }

  Future<Profile> updateUser({String id, Profile user}) async {
    final json = await rest.patch('users/$id', data: {
      'name': user.name,
      'email': user.email,
      'location': user.location,
      'phone': user.phone,
      'password': user.password
    });
    return Profile.fromJson(json);
  }

}