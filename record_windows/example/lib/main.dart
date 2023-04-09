import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:record_windows/record_windows.dart';

Future<void> main() async {
  final record = RecordWindows();

  // final d = await record.listInputDevices();

  await record.start(
    path: p.join(File(Platform.resolvedExecutable).parent.path, 'rec.m4a'),
  );

  // Test ampltiude
  final timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
    print(record.getAmplitude());
  });

  await Future.delayed(const Duration(seconds: 3));

  await record.pause();
  await Future.delayed(const Duration(seconds: 1));

  await record.resume();
  await Future.delayed(const Duration(seconds: 1));

  timer.cancel();
  await record.stop();
}
