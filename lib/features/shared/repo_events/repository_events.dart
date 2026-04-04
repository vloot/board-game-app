import 'dart:async';

class RepositoryEvents {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get stream => _controller.stream;

  StreamSubscription<void> subscribe(void Function(void) callback) =>
      stream.listen(callback);

  void notify() => _controller.add(null);

  void dispose() => _controller.close();
}
