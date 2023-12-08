import 'package:dio/dio.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/utils/apis/apis.dart';

class ShipsServiceResponse {
  List<ShipsEntity>? shipsEntityList;
  int? statusCode;
  String? statusMessage;
  DioException? dioException;

  ShipsServiceResponse({
    this.shipsEntityList,
    this.statusCode,
    this.statusMessage,
    this.dioException,
  });
}

class ShipsService {
  Future<ShipsServiceResponse> getShips() async {
    return Dio().get(Api.shipsUrl).then((response) {
      if (response.statusCode! == 200 || response.statusCode! == 201) {
        return ShipsServiceResponse(
            shipsEntityList: ShipsEntity.fromJsonList(response.data));
      } else {
        return ShipsServiceResponse(
            statusMessage: response.statusMessage,
            statusCode: response.statusCode);
      }
    }).catchError((err) async {
      return ShipsServiceResponse(dioException: err as DioException);
    });
  }
}
