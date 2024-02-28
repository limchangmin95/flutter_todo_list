import 'dart:io';

const emulatorIp = "10.0.2.2:8000/api/v1";
const simulartIp = "127.0.0.1:8000/api/v1";

final ip = Platform.isIOS ? simulartIp : emulatorIp;
