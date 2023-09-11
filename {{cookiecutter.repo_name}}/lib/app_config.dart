import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/extensions.dart';
{%- if cookiecutter.is_theme_enable != false -%}
import 'values/app_theme_store.dart';
{% endif %}

class AppConfig extends StatelessWidget {
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: context.hideKeyboard,
        child: {%- if cookiecutter.is_theme_enable != false -%}
          const {{cookiecutter._app_class_name}}App().withProvider(AppThemeStore()),
        {% else %}
          const {{cookiecutter._app_class_name}}App(),
        {% endif %}
    );
  }
}
