/// Collect all subscriptions to a bag
import 'package:rxdart/rxdart.dart';
mixin StreamSubscriptionsMixin {
  final CompositeSubscription bag = CompositeSubscription();

  void dispose() {
    bag.dispose();
  }
}