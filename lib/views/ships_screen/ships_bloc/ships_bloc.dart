import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampledriftdatabasewithblocpattern/data/database/entities/ships_entity.dart';
import 'package:sampledriftdatabasewithblocpattern/data/models/ships/ships_data_model.dart';
import 'package:sampledriftdatabasewithblocpattern/data/repositories/ships_repository.dart';
import 'package:sampledriftdatabasewithblocpattern/utils/error_handling.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ships_screen/ships_bloc/ships_events.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ships_screen/ships_bloc/ships_states.dart';

class ShipsBloc extends Bloc<ShipsEvents, ShipsStates> {
  final ShipsRepository _shipsRepository = ShipsRepository();

  ShipsBloc(ShipsStates shipsStates) : super(shipsStates) {
    on<ShipsFetchData>(_onShipsFetched);
    on<ShipsFromLocalDatabase>(_shipsFromLocalDatabase);
    on<ShipsLocalSearch>(_onShipsLocalSearch);
  }

  Future<void> _onShipsFetched(
    ShipsFetchData event,
    Emitter<ShipsStates> emit,
  ) async {
    emit(ShipsLoadingState());
    await _shipsRepository
        .requestAndSaveDataLocal()
        .then((shipsServiceResponse) async {
      if (shipsServiceResponse.shipsEntityList != null) {
        List<ShipsDataModel> shipsDataModelList =
            await ShipsDataModel.createShipsDataModel(
                shipsServiceResponse.shipsEntityList!);
        emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
      } else {
        emit(ShipsErrorState(
          error: ErrorHandling.getErrorMessage(
            shipsServiceResponse.dioException,
            shipsServiceResponse.statusMessage,
            shipsServiceResponse.statusCode ?? -1,
          ),
          statusCode: -1,
        ));
      }
    });
  }

  Future<void> _shipsFromLocalDatabase(
    ShipsFromLocalDatabase event,
    Emitter<ShipsStates> emit,
  ) async {
    emit(ShipsLoadingState());
    List<ShipsEntity> shipsEntityList = await ShipsEntity.getAllShips();
    List<ShipsDataModel> shipsDataModelList =
        await ShipsDataModel.createShipsDataModel(shipsEntityList);
    emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
  }

  Future<void> _onShipsLocalSearch(
    ShipsLocalSearch event,
    Emitter<ShipsStates> emit,
  ) async {
    List<ShipsEntity> shipsEntityList =
        await ShipsEntity.getShipsByName(event.searchText ?? "");
    List<ShipsDataModel>? shipsDataModelList =
        await ShipsDataModel.createShipsDataModel(shipsEntityList);
    emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
  }
}
