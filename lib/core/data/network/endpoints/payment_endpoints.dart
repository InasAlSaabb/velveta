import 'package:flutter_templete/core/data/network/network_config.dart';

class PaymentEnsPoints {
  static String Pay = NetworkConfig.getFullApiRoute4('order/paySuccess');
  static String failedpay = NetworkConfig.getFullApiRoute4('order/payFailed');
}
