import 'package:drift/drift.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/database.dart';

class PositionEntity {
  double? latitude;
  double? longitude;
  String? shipId;

  PositionEntity({
    this.latitude,
    this.longitude,
    this.shipId,
  });

  PositionEntity.fromJson(Map<String, dynamic> json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
  }

  PositionCompanion toCompanion(String shipId) {
    return PositionCompanion(
      latitude: Value(latitude ?? -1),
      longitude: Value(longitude ?? -1),
      shipId: Value(shipId),
    );
  }

  static Future<PositionEntity> savePosition(
      PositionEntity positionEntity, String shipId) async {
    AppDb appDb = AppDb.instance;
    await appDb
        .into(appDb.position)
        .insertOnConflictUpdate(positionEntity.toCompanion(shipId));
    return positionEntity;
  }

  static Future<PositionEntity?> getShipById(String shipId) async {
    AppDb appDb = AppDb.instance;
    PositionTable? positionTable = await (appDb.select(appDb.position)
          ..where((tbl) => tbl.shipId.equals(shipId)))
        .getSingleOrNull();
    PositionEntity? positionEntity;
    if (positionTable != null) {
      positionEntity =
          PositionEntity.positionTableConvertTPositionEntity(positionTable);
    }
    return positionEntity;
  }

  static PositionEntity? positionTableConvertTPositionEntity(
      PositionTable? positionTable) {
    PositionEntity? positionEntity;
    if (positionTable != null) {
      positionEntity = PositionEntity();
      positionEntity.latitude = positionTable.latitude;
      positionEntity.longitude = positionTable.longitude;
      positionEntity.shipId = positionTable.shipId;
    }
    return positionEntity;
  }
}
