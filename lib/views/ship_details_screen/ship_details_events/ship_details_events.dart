abstract class ShipDetailsEvents {}

class ShipDetailsLocalQuery extends ShipDetailsEvents {
  final String shipId;

  ShipDetailsLocalQuery(this.shipId);
}
