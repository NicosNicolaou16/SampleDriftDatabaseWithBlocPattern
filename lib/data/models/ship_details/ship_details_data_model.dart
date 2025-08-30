import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';

class ShipDetailsDataModel {
  final ShipsEntity shipsEntity;
  final ShipDetailsViewType shipDetailsViewType;

  ShipDetailsDataModel(this.shipsEntity, this.shipDetailsViewType);

  static Future<List<ShipDetailsDataModel>> createShipDetailsDataModel(
      String shipId) async {
    List<ShipDetailsDataModel> shipDetailsDataModelList = [];

    ShipsEntity? shipsEntity = await ShipsEntity.getShipById(shipId);

    if (shipsEntity != null) {
      shipDetailsDataModelList.add(ShipDetailsDataModel(
          shipsEntity, ShipDetailsViewType.photoViewType));
      shipDetailsDataModelList.add(ShipDetailsDataModel(
          shipsEntity, ShipDetailsViewType.infoViewType));
    }

    return shipDetailsDataModelList;
  }
}

enum ShipDetailsViewType {
  photoViewType,
  infoViewType,
}
