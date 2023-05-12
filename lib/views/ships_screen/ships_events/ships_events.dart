import 'package:equatable/equatable.dart';

abstract class ShipsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class ShipsFetchData extends ShipsEvents {}

class ShipsFromLocalDatabase extends ShipsEvents {}

class ShipsLocalSearch extends ShipsEvents {
  String? searchText;

  ShipsLocalSearch(this.searchText);
}
