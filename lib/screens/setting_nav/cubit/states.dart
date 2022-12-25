abstract class SettingState{}

class SettingIntial extends SettingState{}


class Settingloading extends SettingState{}

class Settingsucess extends SettingState{}

class Settingerror extends SettingState{
  String error;

  Settingerror(this.error);

}


class Settingupdateloading extends SettingState{}

class Settingupdatesucess extends SettingState{}

class Settingupdateerror extends SettingState{
  String error;

  Settingupdateerror(this.error);

}