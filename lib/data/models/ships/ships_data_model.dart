import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';

class ShipsDataModel {
  final ShipsEntity shipsEntity;

  ShipsDataModel(this.shipsEntity);

  static Future<List<ShipsDataModel>> createShipsDataModel(
      List<ShipsEntity> shipsEntityList) async {
    List<ShipsDataModel> shipsDataModelList = [];

    await Future.forEach(shipsEntityList, (ShipsEntity shipsEntity) {
      shipsDataModelList.add(ShipsDataModel(shipsEntity));
    });

    return shipsDataModelList;
  }
}
