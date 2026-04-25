import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'add_members_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAddMembers',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/add_members'],
)
void configureAddMembers(GetIt getIt) {
  getIt.initAddMembers();
}
