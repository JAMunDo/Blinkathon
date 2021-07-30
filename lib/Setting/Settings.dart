import 'package:flutter/material.dart';
import 'package:my_app/Setting/Billing.dart';
import 'package:settings_ui/settings_ui.dart';

import 'Account.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>  {
  bool lockInBackground = true;
  bool notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        // SettingsSection(
        //   title: 'Common',
        //   tiles: [
        //     SettingsTile(
        //       title: 'Language',
        //       subtitle: 'English',
        //       leading: Icon(Icons.language),
        //       // onPressed: (context) {
        //       //   Navigator.of(context).push(MaterialPageRoute(
        //       //     builder: (_) => LanguagesScreen(),
        //       //   ));
        //       // },
        //     ),
        //   ],
        // ),
        SettingsSection(
          tiles: [
            SettingsTile(title: 'Account', leading: Icon(Icons.account_box),onPressed: (context) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Account(),
              ));
            },),
            SettingsTile(title: 'Billing', leading: Icon(Icons.monetization_on),onPressed: (context) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Billing(),
              ));
            },),
            SettingsTile(title: 'Contact Us', leading: Icon(Icons.contact_mail)),
            SettingsTile(title: 'Terms of Service', leading: Icon(Icons.description)),
          ],
        ),
        CustomSection(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 8),
                child: Image.asset(
                  './lib/assets/settings.png',
                  height: 50,
                  width: 50,
                  color: Color(0xFF777777),
                ),
              ),
              Text(
                'Version: 1.0.0',
                style: TextStyle(color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}