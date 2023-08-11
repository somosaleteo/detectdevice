import 'package:detectdevice/interfaces/interfaces.dart';

import '../services/device_info_service.dart';

class DeviceInfoProvider extends Provider {
  DeviceInfoProvider(this.deviceInfoService);

  final DeviceInfoService deviceInfoService;
}
