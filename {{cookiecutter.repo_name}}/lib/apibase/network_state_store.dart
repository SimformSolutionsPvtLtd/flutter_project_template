import 'package:mobx/mobx.dart';

import '../../values/enumeration.dart';

part 'network_state_store.g.dart';

class NetworkStateStore = _NetworkStateStore with _$NetworkStateStore;

abstract class _NetworkStateStore with Store {
  @observable
  NetworkState state = NetworkState.loading;

  @observable
  String? serverError;
}
