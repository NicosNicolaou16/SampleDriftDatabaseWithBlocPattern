import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampledriftdatabasewithblocpattern/data/models/ships/ships_data_model.dart';
import 'package:sampledriftdatabasewithblocpattern/domain/repositories/ships_repository.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ships_screen/ships_events/ships_events.dart';
import 'package:sampledriftdatabasewithblocpattern/views/ships_screen/ships_states/ships_states.dart';

class ShipsBloc extends Bloc<ShipsEvents, ShipsStates> {
  ShipsRepository shipsRepository = ShipsRepository();

  ShipsBloc(ShipsStates shipsStates): super(shipsStates) {
    on(_onShipsFetched);
  }

  Future<void> _onShipsFetched(
    ShipsFetchData event,
    Emitter<ShipsStates> emit,
  ) async {
    emit(ShipsLoadingState());
    await shipsRepository.requestAndSaveDataLocal().then((value) async {
      List<ShipsDataModel> shipsDataModelList =
          await ShipsDataModel.createShipsDataModel(value);
      emit(ShipsLoadedState(shipsDataModelList: shipsDataModelList));
    }).catchError((err) async {
      emit(const ShipsErrorState(
        error: "Something went wrong",
        statusCode: -1,
      ));
    });
  }
}
