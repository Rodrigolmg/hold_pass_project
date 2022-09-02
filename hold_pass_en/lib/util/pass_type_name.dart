import 'package:hold_pass_en/util/pass_type.dart';

class PassTypeName{

  static String getTypeName(PassType type){
    switch(type){
      case PassType.email:
        return 'e-mail';
      case PassType.website:
        return 'website';
      case PassType.app:
        return 'app';
      case PassType.game:
        return 'game';
      case PassType.other:
        return 'other';
    }
  }

}