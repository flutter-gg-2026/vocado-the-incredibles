import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'view_members_di.config.dart'; 

@InjectableInit(
  initializerName: 'initViewMembers',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/view_members'],
)
void configureViewMembers(GetIt getIt) {
  getIt.initViewMembers();
}
