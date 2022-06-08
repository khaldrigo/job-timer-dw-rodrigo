import 'package:isar/isar.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:path_provider/path_provider.dart';

import './database.dart';

class DatabaseImpl implements Database {
  Isar? _databaseIntance;

  @override
  Future<Isar> openConnection() async {
    if (_databaseIntance == null) {
      final dir = await getApplicationSupportDirectory();
      _databaseIntance = await Isar.open(
        schemas: [ProjectTaskSchema, ProjectSchema],
        directory: dir.path,
        inspector: true,
      );
    }
    return _databaseIntance!;
  }
}
