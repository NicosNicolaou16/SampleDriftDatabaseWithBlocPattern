import 'package:sampledriftdatabasewithblocpattern/data/database/entities/missions_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/entities/position_entity.dart';

class ShipsEntity {
  String? id;
  String? shipName;
  String? shipType;
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
  List<PositionEntity>? positionEntityList;
  List<MissionsEntity>? missionsEntityList;

  ShipsEntity(
      {this.id,
      this.shipName,
      this.shipType,
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
      this.positionEntityList,
      this.missionsEntityList});
}
