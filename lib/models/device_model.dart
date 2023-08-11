import '../interfaces/interfaces.dart';

class DeviceModel extends Model {
  final Map<String, dynamic> deviceInfo;
  final bool isModified;
  final String nameOs;
  final String deviceSerial;

  DeviceModel({
    required this.deviceInfo,
    this.isModified = false,
    required this.nameOs,
    required this.deviceSerial,
  });

  DeviceModel copyWith({
    Map<String, dynamic>? deviceInfo,
    bool? isModified,
    String? nameOs,
    String? deviceSerial,
  }) {
    return DeviceModel(
      deviceInfo: deviceInfo ?? this.deviceInfo,
      isModified: isModified ?? this.isModified,
      nameOs: nameOs ?? this.nameOs,
      deviceSerial: deviceSerial ?? this.deviceSerial,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceModel &&
          runtimeType == other.runtimeType &&
          deviceInfo == other.deviceInfo &&
          isModified == other.isModified &&
          nameOs == other.nameOs &&
          deviceSerial == other.deviceSerial;

  @override
  int get hashCode =>
      deviceInfo.hashCode ^
      isModified.hashCode ^
      nameOs.hashCode ^
      deviceSerial.hashCode;
}
