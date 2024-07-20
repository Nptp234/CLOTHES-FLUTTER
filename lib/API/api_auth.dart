import 'package:clothes_app/API/api.dart';
import 'package:clothes_app/objects/user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthAPI {
  API api = API();

  Future<String> signUp(String username, String email, String password) async {
    try {
      Response response = await api.sendRequest.post(
        '/Auth/signUp',
        data: {
          'Username': username,
          'Email': email,
          'Password': password,
        },
        options: Options(headers: api.header('no token')),
      );

      if (response.statusCode == 200) {
        // SignUp successful
        print('SignUp successful');
        return '${response.statusCode}';
      } else {
        // Handle error
        print('SignUp failed: ${response.data}');
        throw Exception('Failed to signUp');
      }
    } catch (e) {
      // Handle Dio errors or exceptions
      print('Error during signUp: $e');
      throw Exception('Failed to signUp');
    }
  }

  Future<String> signIn(String email, String password) async{
    try{
      final body = FormData.fromMap({'Email': email, 'Password': password});

      Response res = await api.sendRequest.post(
        '/Auth/signIn', 
        data: body
      );

      if (res.statusCode==200){
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        final tokenData = res.data["token"];
        sharedPreferences.setString('token', tokenData);

        UserAcount user = await setCurrentUser(tokenData);
        sharedPreferences.setString('email', user.email!);
        sharedPreferences.setString('username', user.name!);
        sharedPreferences.setString('password', user.password!);

        return tokenData;
      }
      else{
        return 'fail';
      }
    }
    catch(e){
      rethrow;
    }
  }

  Future<UserAcount> setCurrentUser(String token) async{
    try{
      Response res = await api.sendRequest.get('/Auth/current', options: Options(headers: api.header(token)));
      UserAcount userAcount = UserAcount();
      userAcount = UserAcount.fromJson(res.data["user"]);
      return userAcount;
    }
    catch(e){
      rethrow;
    }
  }
}
