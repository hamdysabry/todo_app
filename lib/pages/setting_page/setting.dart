import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/setting_page/widget/language_bottom_sheet.dart';
import 'package:todo_app/pages/setting_page/widget/theme_mode_bottom_sheet.dart';
import 'package:todo_app/shared-components/theme/color.dart';

import '../../provider/setting_provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var theme = Theme.of(context);
    var applocal = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            applocal!.language,
            style: theme.textTheme.bodySmall!
                .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              showthemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: primaryColor,
                    width: 1.5,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.currentlanguage == "en" ? "English" : "عربي",
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: primaryColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            applocal!.mode,
            style: theme.textTheme.bodySmall!
                .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              showthememodeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: primaryColor,
                    width: 1.5,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDark()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: primaryColor),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showthemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showthememodeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ModeBottomSheet());
  }
}
