abstract class ShipsEvents {}

class ShipsFetchData extends ShipsEvents {}

class ShipsFromLocalDatabase extends ShipsEvents {}

class ShipsLocalSearch extends ShipsEvents {
  String? searchText;

  ShipsLocalSearch(this.searchText);
}
