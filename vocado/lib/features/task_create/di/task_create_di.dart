import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'task_create_di.config.dart'; 

@InjectableInit(
  initializerName: 'initTaskCreate',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/task_create'],
)
void configureTaskCreate(GetIt getIt) {
  getIt.initTaskCreate();
}
