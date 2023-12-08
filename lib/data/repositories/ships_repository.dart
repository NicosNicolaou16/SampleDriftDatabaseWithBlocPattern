import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/domain/remote/ships_service.dart';

class ShipsRepository {
  final ShipsService _shipsService = ShipsService();

  Future<ShipsServiceResponse> requestAndSaveDataLocal() async {
    ShipsServiceResponse? shipsServiceResponse = await _shipsService.getShips();
    if (shipsServiceResponse.shipsEntityList != null) {
      await saveShipOnLocalDatabase(shipsServiceResponse.shipsEntityList);
    }
    return shipsServiceResponse;
  }

  Future<void> saveShipOnLocalDatabase(
      List<ShipsEntity>? shipsEntityList) async {
    if (shipsEntityList != null) {
      await ShipsEntity.saveShips(shipsEntityList);
    }
  }
}
