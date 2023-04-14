import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/domain/remote/ships_service.dart';

class ShipsRepository {
  final ShipsService _shipsService = ShipsService();

  Future<List<ShipsEntity>> requestAndSaveDataLocal() async {
    List<ShipsEntity>? shipsEntityList =
        await ShipsEntity.addShips(await _shipsService.getShips());
    return shipsEntityList;
  }
}
