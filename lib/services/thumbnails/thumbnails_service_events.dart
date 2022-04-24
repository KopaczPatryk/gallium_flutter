abstract class ServiceEvent {}

class Init extends ServiceEvent {
  final bool wipeCache;

  Init({
    this.wipeCache = false,
  });
}
