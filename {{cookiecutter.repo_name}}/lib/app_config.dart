import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'utils/extensions.dart';
{%- if cookiecutter.is_theme_enable != false -%}
import 'values/app_theme_store.dart';
{% endif %}


class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
        onTap: context.hideKeyboard,
        child: Builder(
            builder: (ctx) => {%- if cookiecutter.is_theme_enable != false -%}
            const App().withProvider(AppThemeStore(),),
        {% else %}
        const App(),
    {% endif %}
    )
    ,
    );
  }
}
