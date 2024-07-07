import 'package:bloc_example/model/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  static Future<List<UserModel>> getAllUSer() async {
    final dio = Dio();
    try {
      final response = await dio.get("https://reqres.in/api/users?page=2");
      final List<UserModel> data =
          (response.data["data"] as List).map((e) => UserModel.fromJson(e)).toList();
      return data;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
