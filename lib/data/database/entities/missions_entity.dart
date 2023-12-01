import 'package:drift/drift.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/database.dart';

class MissionsEntity {
  String? name;
  int? flight;
  String? shipId;

  MissionsEntity({
    this.name,
    this.flight,
    this.shipId,
  });

  MissionsEntity.fromJson(Map<String, dynamic> json) {
    name = json["ship"];
    flight = json["ship_name"];
  }

  static List<MissionsEntity> fromJsonList(List json) {
    List<MissionsEntity> missionsEntityList;
    if (json != null) {
      missionsEntityList =
          List<MissionsEntity>.from(json.map((e) => MissionsEntity.fromJson(e)))
              .toList();
    } else {
      return [];
    }
    return missionsEntityList;
  }

  MissionsCompanion toCompanion(String shipId) {
    return MissionsCompanion(
      name: Value(name ?? ""),
      flight: Value(flight ?? -1),
      shipId: Value(shipId),
    );
  }

  static Future<void> deleteAllMissions(AppDb appDb) async {
    await appDb.delete(appDb.missions).go();
  }

  static Future<List<MissionsEntity>> saveMissions(
      List<MissionsEntity> missionsEntityList, String shipId) async {
    AppDb appDb = AppDb.instance;
    await Future.forEach(missionsEntityList,
        (MissionsEntity missionsEntity) async {
      await appDb
          .into(appDb.missions)
          .insertOnConflictUpdate(missionsEntity.toCompanion(shipId));
    });
    return missionsEntityList;
  }

  static Future<List<MissionsEntity>> getAllMissionsByShipId(
      String shipId) async {
    AppDb appDb = AppDb.instance;
    List<MissionsTable>? missionsTableList = await (appDb.select(appDb.missions)
          ..where((tbl) => tbl.shipId.equals(shipId)))
        .get();
    List<MissionsEntity>? missionsEntityList = [];
    await Future.forEach(missionsTableList, (MissionsTable? missionsTable) {
      if (missionsTable != null) {
        MissionsEntity? missionsEntity =
            MissionsEntity.missionsTableConvertToMissionsEntity(missionsTable);
        if (missionsEntity != null) {
          missionsEntityList.add(missionsEntity);
        }
      }
    });
    return missionsEntityList;
  }

  static MissionsEntity? missionsTableConvertToMissionsEntity(
      MissionsTable? missionsTable) {
    MissionsEntity? missionsEntity;
    if (missionsTable != null) {
      missionsEntity = MissionsEntity();
      missionsEntity.name = missionsTable.name;
      missionsEntity.flight = missionsTable.flight;
      missionsEntity.shipId = missionsTable.shipId;
    }
    return missionsEntity;
  }
}
