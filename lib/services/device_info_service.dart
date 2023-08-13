import '../models/device_model.dart';

abstract class DeviceInfoService {
  DeviceModel getInfo();
  Future<bool> getIsModified();
  bool get isVirtualDevice;
  Future<bool> get isJailbreakDevice;
  Future<bool> get isOsModified;
  Future<bool> get isTamperingRisk;
}
