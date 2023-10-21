import 'package:event_bus/event_bus.dart';

class Bus {
  static late EventBus eventBus;

  static init() {
    Bus.eventBus = EventBus();
  }
}
// 更新记录
class UpdateRecordEvent {
  final String type;
  const UpdateRecordEvent(this.type);
}
// 更新首页统计
class UpdateTotalEvent {
  final String type;
  const UpdateTotalEvent(this.type);
}
