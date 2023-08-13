import 'package:detectdevice/interfaces/interfaces.dart';

import '../models/device_model.dart';
import '../services/device_info_service.dart';

class DeviceInfoProvider extends Provider {
  DeviceInfoProvider(this.deviceInfoService);

  final DeviceInfoService deviceInfoService;

  Future<bool> get isJailBreak => deviceInfoService.isJailbreakDevice;

  DeviceModel getInfo() {
    return deviceInfoService.getInfo();
  }

  Future<bool> getIsModified() async {
    return await deviceInfoService.getIsModified();
  }

  bool get isVirtualDevice => deviceInfoService.isVirtualDevice;
  Future<bool> get isJailbreakDevice => deviceInfoService.isJailbreakDevice;
  Future<bool> get isOsModified => deviceInfoService.isOsModified;
  Future<bool> get isTamperingRisk => deviceInfoService.isTamperingRisk;
}
