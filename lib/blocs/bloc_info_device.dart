import 'package:freerasp/freerasp.dart';

import '../interfaces/interfaces.dart';
import '../models/device_model.dart';
import '../providers/device_info_provider.dart';
import '../services/device_info_plus_service.dart';

class BlocInfoDevice extends Bloc {
  DeviceModel get deviceModelInfoPlus =>
      deviceInfoPlusProvider.deviceInfoService.getInfo();

  bool get isVirtualDevice =>
      (deviceModelInfoPlus.deviceInfo['isPhysicalDevice'] ?? true) == false;

  final Stream<Threat> streamTampering = Talsec.instance.onThreatDetected;

  bool get isModified {
    bool isM = false;
    if (isVirtualDevice) {
      return true;
    }
    return isM;
  }

  Future<bool> get isJailbreak async {
    return deviceInfoPlusProvider.isJailBreak;
  }

  Future<bool> get isTamperingRisk => deviceInfoPlusProvider.isTamperingRisk;

  final DeviceInfoProvider deviceInfoPlusProvider = DeviceInfoProvider(
    DeviceInfoPlusService(),
  );
}
