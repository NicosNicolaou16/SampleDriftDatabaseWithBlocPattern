import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/database.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/entities/missions_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/entities/position_entity.dart';

class ShipsEntity {
  String? id;
  String? shipName;
  String? shipType;
  String? shipModel;
  bool? active;
  int? imo;
  int? abs;
  int? clazz;
  int? weightLbs;
  int? yearBuild;
  String? homePort;
  String? status;
  String? courseDeg;
  int? successfulLandings;
  int? attemptedLandings;
  String? url;
  String? image;
  PositionEntity? positionEntity;
  List<MissionsEntity>? missionsEntityList;

  ShipsEntity({
    this.id,
    this.shipName,
    this.shipType,
    this.shipModel,
    this.active,
    this.imo,
    this.abs,
    this.clazz,
    this.weightLbs,
    this.yearBuild,
    this.homePort,
    this.status,
    this.courseDeg,
    this.successfulLandings,
    this.attemptedLandings,
    this.url,
    this.image,
    this.positionEntity,
    this.missionsEntityList,
  });

  ShipsEntity.fromJson(Map<String, dynamic> json) {
    id = json["ship_id"];
    shipName = json["ship_name"];
    shipType = json["ship_type"];
    shipModel = json["ship_model"];
    active = json["active"];
    imo = json["imo"];
    abs = json["abs"];
    clazz = json["class"];
    weightLbs = json["weight_lbs"];
    yearBuild = json["year_built"];
    homePort = json["home_port"];
    status = json["status"];
    courseDeg = json["course_deg"];
    successfulLandings = json["successful_landings"];
    attemptedLandings = json["attempted_landings"];
    url = json["url"];
    image = json["image"];
    positionEntity = PositionEntity.fromJson(json["position"]);
    missionsEntityList = MissionsEntity.fromJsonList(json["missions"]);
  }

  static List<ShipsEntity> fromJsonList(List json) {
    List<ShipsEntity> shipEntityList;
    if (json != null) {
      shipEntityList =
          List<ShipsEntity>.from(json.map((e) => ShipsEntity.fromJson(e)))
              .toList();
    } else {
      return [];
    }
    return shipEntityList;
  }

  ShipsCompanion toCompanion() {
    return ShipsCompanion(
      id: Value(id ?? ""),
      shipName: Value(shipName ?? ""),
      shipType: Value(shipType ?? ""),
      shipModel: Value(shipModel ?? ""),
      active: Value(active == true ? 1 : 0),
      imo: Value(imo ?? -1),
      abs: Value(abs ?? -1),
      clazz: Value(clazz ?? -1),
      weightLbs: Value(weightLbs ?? -1),
      homePort: Value(homePort ?? ""),
      status: Value(status ?? ""),
      courseDeg: Value(courseDeg ?? ""),
      successfulLandings: Value(successfulLandings ?? -1),
      attemptedLandings: Value(attemptedLandings ?? -1),
      url: Value(url ?? ""),
      image: Value(image ?? ""),
    );
  }

  static Future<List<ShipsEntity>> addShips(
      List<ShipsEntity> shipsEntityList) async {
    AppDb appDb = AppDb.instance;
    await Future.forEach(shipsEntityList, (ShipsEntity shipEntity) async {
      PositionEntity? positionEntity = shipEntity.positionEntity;
      if (positionEntity != null) {
        await PositionEntity.addPosition(positionEntity, shipEntity.id ?? "-1");
      }
      List<MissionsEntity>? missionsEntityList = shipEntity.missionsEntityList;
      if (missionsEntityList != null) {
        await MissionsEntity.addMissions(
            missionsEntityList, shipEntity.id ?? "-1");
      }
      await appDb
          .into(appDb.ships)
          .insertOnConflictUpdate(shipEntity.toCompanion());
    });
    return shipsEntityList;
  }

  static Future<List<ShipsEntity>> getAllShips() async {
    AppDb appDb = AppDb.instance;
    List<ShipsTable>? shipsTableList = await appDb.select(appDb.ships).get();
    List<ShipsEntity>? shipsEntityList = [];
    await Future.forEach(shipsTableList, (ShipsTable? shipTable) {
      if (shipTable != null) {
        ShipsEntity? shipsEntity =
            ShipsEntity.shipsTableConvertToShipsEntity(shipTable);
        if (shipsEntity != null) {
          shipsEntityList.add(shipsEntity);
        }
      }
    });
    return shipsEntityList;
  }

  static Future<ShipsEntity?> getShipById(String shipId) async {
    AppDb appDb = AppDb.instance;
    ShipsTable? shipsTable = await (appDb.select(appDb.ships)
          ..where((tbl) => tbl.id.equals(shipId)))
        .getSingleOrNull();
    ShipsEntity? shipsEntity;
    if (shipsTable != null) {
      shipsEntity = ShipsEntity.shipsTableConvertToShipsEntity(shipsTable);
    }
    return shipsEntity;
  }

  static ShipsEntity? shipsTableConvertToShipsEntity(ShipsTable? shipsTable) {
    ShipsEntity? shipsEntity;
    if (shipsTable != null) {
      shipsEntity = ShipsEntity();
      shipsEntity.id = shipsTable.id;
      shipsEntity.shipName = shipsTable.shipName;
      shipsEntity.shipType = shipsTable.shipType;
      shipsEntity.shipModel = shipsTable.shipModel;
      shipsEntity.active = shipsTable.active == 1;
      shipsEntity.imo = shipsTable.imo;
      shipsEntity.abs = shipsTable.abs;
      shipsEntity.clazz = shipsTable.clazz;
      shipsEntity.weightLbs = shipsTable.weightLbs;
      shipsEntity.homePort = shipsTable.homePort;
      shipsEntity.status = shipsTable.status;
      shipsEntity.successfulLandings = shipsTable.successfulLandings;
      shipsEntity.attemptedLandings = shipsTable.attemptedLandings;
      shipsEntity.url = shipsTable.url;
      shipsEntity.image = shipsTable.image;
      shipsEntity.positionEntity = PositionEntity();
      shipsEntity.missionsEntityList = [];
    }
    return shipsEntity;
  }
}
