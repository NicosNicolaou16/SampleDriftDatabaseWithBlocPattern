import 'package:sampledriftdatabasewithblocpattern/data/models/ships/ships_data_model.dart';

abstract class ShipsStates {
  const ShipsStates();
}

class ShipsInitialState extends ShipsStates {}

class ShipsLoadingState extends ShipsStates {}

class ShipsLoadedState extends ShipsStates {
  List<ShipsDataModel> shipsDataModelList = [];

  ShipsLoadedState({
    required this.shipsDataModelList,
  });
}

class ShipsErrorState extends ShipsStates {
  final String? error;
  final int? statusCode;

  const ShipsErrorState({
    this.error,
    this.statusCode,
  });
}
