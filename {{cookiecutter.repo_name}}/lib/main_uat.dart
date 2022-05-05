import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
{%- if cookiecutter.sentry_dsn_key != "NA" -%}
import 'package:sentry_flutter/sentry_flutter.dart';
{% endif %}

import 'app_config.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'flavors/flavor_values.dart';
import 'locator.dart';
import 'utils/helpers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setAppOrientation();
  setupLogging();
  debugPaintSizeEnabled = false;
  setupLocator();
  {%- if cookiecutter.sentry_dsn_key == "NA" -%}
  runApp(FlavoredApp());
  {% else %}
  SentryFlutter.init(
  (options) => options.dsn = 'https://{{cookiecutter.sentry_dsn_key}}@o0.ingest.sentry.io/0',
  appRunner: () => runApp(FlavoredApp()),
  );
  {% endif %}
}

class FlavoredApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlavorConfig(
      flavor: Flavor.uat,
      values: FlavorValues(baseUrl: 'https://api.revolve.net',),
      child: AppConfig(),
    );
  }
}

