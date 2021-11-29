import 'package:get/get.dart';

class MultiLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'user': 'User',
          'login': 'Login',
          'myNews': 'My News',
          'proile': 'Profile',
          'search': 'Search',
        },
        'tr_TR': {'user': 'Kullanıcı', 'amount': 'Miktar', 'myNews': 'Bana Özel', 'profile': 'Profil', 'search': 'Keşfet'}
      };
}
