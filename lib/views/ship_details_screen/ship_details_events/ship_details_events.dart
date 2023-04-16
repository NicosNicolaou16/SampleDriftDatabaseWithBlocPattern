import 'package:equatable/equatable.dart';

abstract class ShipDetailsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ShipDetailsLocalQuery extends ShipDetailsEvents {
  final String shipId;

  ShipDetailsLocalQuery(this.shipId);
}