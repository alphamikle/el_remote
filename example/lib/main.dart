import 'package:easiest_remote_localization/easiest_remote_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RemoteLocalizationProvider<LocalizationMessages>> remoteLocalizationProviders = [
      RemoteLocalizationProvider<LocalizationMessages>(
        options: BaseOptions(baseUrl: 'https://indieloper.b-cdn.net'),
        cacheTTL: const Duration(minutes: 10),
        sources: const [
          RemoteSource(locale: Locale('en'), url: '/en.json', type: SourceType.json),
          RemoteSource(locale: Locale('en', 'CA'), url: '/en_CA.json', type: SourceType.json),
          RemoteSource(locale: Locale('fr', 'CA'), url: '/fr_CA.json', type: SourceType.json),
          RemoteSource(locale: Locale('fr', 'FR'), url: '/fr_FR.json', type: SourceType.json),
          RemoteSource(locale: Locale('ru', 'RU'), url: '/ru_RU.json', type: SourceType.json),

          /// Ukrainian language exists only in CDN, without local version
          RemoteSource(locale: Locale('uk', 'UA'), url: '/uk_UA.yaml', type: SourceType.yaml),
        ],
        factory: (RemoteSource source, Json content) => LocalizationMessages.fromJson(content),
      ),
    ];

    return MaterialApp(
      onGenerateTitle: (BuildContext context) => el.appTitle.title(
        today: DateFormat(el.appTitle.dateFormat).format(
          DateTime.now(),
        ),
      ),
      localizationsDelegates: localizationsDelegatesWithProviders(remoteLocalizationProviders),
      supportedLocales: supportedLocalesWithProviders(remoteLocalizationProviders),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int events = 0;

  Widget buildMessage([String? message, String? header]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null)
            Text(
              header,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          if (header != null && message != null) const SizedBox(height: 8),
          if (message != null)
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }

  void addEvent() {
    setState(() {
      events++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Gender gender = events % 3 == 0
        ? Gender.female
        : events % 3 == 1
            ? Gender.male
            : Gender.other;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          el.appTitle.title(
            today: DateFormat(el.appTitle.dateFormat).format(
              DateTime.now(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            buildMessage(null, el.locale.defaultLocale(locale: Intl.defaultLocale ?? 'Unknown')),
            buildMessage(null, el.locale.selectedLocale(locale: Localizations.localeOf(context).toString())),
            buildMessage(el.eventsLogged(events)),
            buildMessage(
              el.officerReport(gender),
            ),
            buildMessage(
              el.logbook.details(events),
              el.logbook.header,
            ),
            buildMessage(el.logbook.summary),
            buildMessage(
              el.logbook.alerts.alertMessage(gender, alerts: el.logbook.alerts.alerts(events)),
              el.logbook.alerts.title,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addEvent,
        tooltip: el.mainScreen.floatingButton.tooltip,
        child: const Icon(Icons.add),
      ),
    );
  }
}
