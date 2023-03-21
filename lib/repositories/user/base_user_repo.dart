
import '../../model/models.dart';

abstract class BaseUserRepo{
  Stream<UserModel> getUser(String userId);
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
}