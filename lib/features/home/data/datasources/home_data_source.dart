import 'package:tech/features/home/domain/entities/business_entity.dart';
import 'package:tech/features/home/domain/entities/user_info_entity.dart';

abstract class HomeDataSource {
  Future<UserInfoEntity> getUser();
  Future<List<BusinessEntity>> getBusinesses();
}