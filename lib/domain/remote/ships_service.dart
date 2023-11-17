import 'package:dio/dio.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/utils/apis/apis.dart';

class ShipsService {
  Future<List<ShipsEntity>> getShips() async {
    return Dio().get(Api.shipsUrl).then((response) {
      if (response.statusCode! == 200) {
        return ShipsEntity.fromJsonList(response.data);
      } else {
        return [];
      }
    });
  }
}
