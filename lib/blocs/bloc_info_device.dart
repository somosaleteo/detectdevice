import 'package:detectdevice/interfaces/interfaces.dart';
import 'package:detectdevice/models/device_model.dart';
import 'package:detectdevice/providers/device_info_provider.dart';
import 'package:detectdevice/services/device_info_plus_service.dart';
import 'package:detectdevice/services/flutter_device_type_service.dart';

class BlocInfoDevice extends Bloc {
  DeviceModel get deviceModelInfoPlus =>
      deviceInfoPlusProvider.deviceInfoService.getInfo();
  DeviceModel get deviceModelTypeProvider =>
      deviceTypeProvider.deviceInfoService.getInfo();

  final DeviceInfoProvider deviceInfoPlusProvider = DeviceInfoProvider(
    DeviceInfoPlusService(),
  );
  final DeviceInfoProvider deviceTypeProvider = DeviceInfoProvider(
    FlutterDeviceTypeService(),
  );
}
