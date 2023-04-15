import 'package:equatable/equatable.dart';
import 'package:sampledriftdatabasewithblocpattern/data/models/ships/ships_data_model.dart';

abstract class ShipsStates extends Equatable {
  const ShipsStates();

  @override
  List<Object> get props => [];
}

class ShipsInitialState extends ShipsStates {}

class ShipsLoadingState extends ShipsStates {}

class ShipsLoadedState extends ShipsStates {
  List<ShipsDataModel> shipsDataModelList = [];

  @override
  List<Object> get props => [shipsDataModelList];

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
