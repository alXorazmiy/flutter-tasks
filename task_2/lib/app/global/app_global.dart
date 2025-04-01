
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_2/app/model/characterModel.dart';
import 'package:task_2/app/model/episodeModel.dart';

import '../service/local/storage_service.dart';

class Global {
    static late StorageService storageService;
    static Future init() async {
        WidgetsFlutterBinding.ensureInitialized();
        await Hive.initFlutter();
        Hive.registerAdapter(CharacterModelAdapter());
        Hive.registerAdapter(EpisodemodelAdapter());
        storageService = await StorageService().init();
    }
}