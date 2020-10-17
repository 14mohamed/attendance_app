import 'package:attendance_app/appConfig/app_config.dart';
import 'package:attendance_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  static final String routeName = '/settingScreen';
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  ThemeProvider _themeProvider;
  @override
  void initState() {
    _themeProvider = Provider.of<ThemeProvider>(context);
    AppConfig().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Setting',
          style: TextStyle(color: Color(0xFFFD6C6E), letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppConfig.blockSizeVertical * 2,
            horizontal: AppConfig.blockSizeHorizontal * 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: AppConfig.blockSizeVertical * 2.5),
              ),
              Switch(
                value: _themeProvider.isDark,
                onChanged: (val) {
                  _themeProvider.setThemeData = val;
                },
                activeColor: Theme.of(context).accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}