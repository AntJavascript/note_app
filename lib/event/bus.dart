import 'package:event_bus/event_bus.dart';

class Bus {
  static late EventBus eventBus;

  static init() {
    Bus.eventBus = EventBus();
  }
}
