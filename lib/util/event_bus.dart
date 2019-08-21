typedef void EventCallback(arg);

class EventBus {
  EventBus._internal();

  static EventBus _singleton = new EventBus._internal();

  factory EventBus() => _singleton;

  var _emap = new Map<Object, List<EventCallback>>();

  void on(eventName, EventCallback callback) {
    if (eventName == null || callback == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(callback);
  }

  void off(eventName, [EventCallback callback]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (callback == null) {
      _emap[eventName] = null;
    } else {
      list.remove(callback);
    }
  }

  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len; i >= 0; i--) {
      list[i](arg);
    }
  }
}

var bus = new EventBus();