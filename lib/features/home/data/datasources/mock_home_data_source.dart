import 'package:tech/features/home/domain/entities/business_entity.dart';
import '../../domain/entities/user_info_entity.dart';
import 'home_data_source.dart';

class MockHomeDataSource implements HomeDataSource {
  @override
  Future<UserInfoEntity> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserInfoEntity(
      id: '1',
      name: 'Asad Tazhibaev',
      email: 'asadtajib@gmail.com',
      phone: '+998 94 956 74 47',
      businessCount: 3,
    );
  }

  @override
  Future<List<BusinessEntity>> getBusinesses() async {
    await Future.delayed(const Duration(seconds: 1));
    return const [
      BusinessEntity(
        id: '1',
        name: 'Coffee House',
        category: 'Кафе и рестораны',
        address: 'Ташкент, ул. Навои 12',
        rating: 4.8,
        isActive: true,
      ),
      BusinessEntity(
        id: '2',
        name: 'TechStore',
        category: 'Электроника',
        address: 'Ташкент, Чиланзар 3',
        rating: 4.5,
        isActive: true,
      ),
      BusinessEntity(
        id: '3',
        name: 'FitLife',
        category: 'Спорт и здоровье',
        address: 'Ташкент, Юнусабад 7',
        rating: 4.2,
        isActive: false,
      ),
    ];
  }
}