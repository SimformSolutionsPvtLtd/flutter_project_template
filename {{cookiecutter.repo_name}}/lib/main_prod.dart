import 'package:flutter/material.dart';
{%- if cookiecutter.sentry_dsn_key != "NA" -%}
import 'package:sentry_flutter/sentry_flutter.dart';
{% endif %}

import 'app_config.dart';
import 'flavors/flavor.dart';
import 'flavors/flavor_config.dart';
import 'flavors/flavor_values.dart';
import 'services/shared_preferences_service.dart';
import 'utils/helpers/helpers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.instance.initialise();
  setAppOrientation();
  setupLogging();
  {%- if cookiecutter.sentry_dsn_key == "NA" -%}
  runApp(const FlavoredApp());
  {% else %}
  SentryFlutter.init(
  (options) => options.dsn = 'https://{{cookiecutter.sentry_dsn_key}}@o0.ingest.sentry.io/0',
  appRunner: () => runApp(const FlavoredApp()),
  );
  {% endif %}
}

class FlavoredApp extends StatelessWidget {
  const FlavoredApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlavorConfig(
      flavor: Flavor.prod,
      values: FlavorValues(
        baseUrl: '{{cookiecutter.base_url}}',
      ),
      child: const AppConfig(),
    );
  }

}

