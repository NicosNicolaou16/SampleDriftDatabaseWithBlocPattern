import 'package:dio/dio.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';

class ShipsService {
  Future<List<ShipsEntity>> getShips() async {
    Response response = await Dio().get("");

    return [];
  }
}
