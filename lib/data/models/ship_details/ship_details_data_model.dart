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
          shipsEntity, ShipDetailsViewType.PHOTO_VIEW_TYPE));
      shipDetailsDataModelList.add(ShipDetailsDataModel(
          shipsEntity, ShipDetailsViewType.INFO_VIEW_TYPE));
    }

    return shipDetailsDataModelList;
  }
}

enum ShipDetailsViewType {
  PHOTO_VIEW_TYPE,
  INFO_VIEW_TYPE,
}
