import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/domain/remote/ships_service.dart';

class ShipsRepository {
  ShipsService? _shipsService;

  Future<List<ShipsEntity>> requestAndSaveDataLocal() async {
    return [];
  }
}
