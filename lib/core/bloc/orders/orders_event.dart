abstract class OrdersEvent{}

class OrdersInitEvent extends OrdersEvent{}
class OrderAcceptEvent extends OrdersEvent{
  final int orderId;

  OrderAcceptEvent(this.orderId);
}
class OrderDetailsEvent extends OrdersEvent{
  final int orderId;

  OrderDetailsEvent(this.orderId);
}