import 'package:equatable/equatable.dart';
import 'package:sampledriftdatabasewithblocpattern/data/models/ship_details/ship_details_data_model.dart';

abstract class ShipDetailsStates extends Equatable {
  const ShipDetailsStates();

  @override
  List<Object> get props => [];
}

class ShipDetailsInitialState extends ShipDetailsStates {}

class ShipDetailsLoadingState extends ShipDetailsStates {}

class ShipDetailsLoadedState extends ShipDetailsStates {
  List<ShipDetailsDataModel> shipDetailsDataModelList;

  @override
  List<Object> get props => [shipDetailsDataModelList];

  ShipDetailsLoadedState({
    required this.shipDetailsDataModelList,
  });
}

class ShipDetailsErrorState extends ShipDetailsStates {
  final String? error;
  final int? statusCode;

  const ShipDetailsErrorState({
    this.error,
    this.statusCode,
  });
}
