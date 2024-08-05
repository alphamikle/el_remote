/// This is generated content. There is no point to change it by hands.

// ignore_for_file: type=lint

import 'dart:developer';

import 'package:easiest_localization/easiest_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

final RegExp _variableRegExp = RegExp(r'\$\{[^}]+\} ?');

typedef Checker<T> = bool Function(T value);

enum Gender {
  male,
  female,
  other,
}

class AppTitle {
  const AppTitle({
    required this.title,
    required this.dateFormat,
  });
  factory AppTitle.fromJson(Map<String, dynamic> json) {
    return AppTitle(
      title: ({required String today}) =>
          (json[r'''title'''] ?? '').toString().replaceAll(r'${today}', today).replaceAll(_variableRegExp, ''),
      dateFormat: (json[r'''date_format''']['value'] ?? '').toString(),
    );
  }
  final String Function({required String today}) title;

  /// Format used for displaying dates in the log Format used for displaying dates in the log Format used for displaying dates in the log
  final String dateFormat;

  Map<String, Object> get _content => {
        r'''title''': title,
        r'''date_format''': dateFormat,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

class $Locale {
  const $Locale({
    required this.defaultLocale,
    required this.selectedLocale,
  });
  factory $Locale.fromJson(Map<String, dynamic> json) {
    return $Locale(
      defaultLocale: ({required String locale}) => (json[r'''defaultLocale'''] ?? '')
          .toString()
          .replaceAll(r'${locale}', locale)
          .replaceAll(_variableRegExp, ''),
      selectedLocale: ({required String locale}) => (json[r'''selectedLocale'''] ?? '')
          .toString()
          .replaceAll(r'${locale}', locale)
          .replaceAll(_variableRegExp, ''),
    );
  }
  final String Function({required String locale}) defaultLocale;

  final String Function({required String locale}) selectedLocale;

  Map<String, Object> get _content => {
        r'''defaultLocale''': defaultLocale,
        r'''selectedLocale''': selectedLocale,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

class MainScreen {
  const MainScreen({
    required this.header,
    required this.floatingButton,
  });
  factory MainScreen.fromJson(Map<String, dynamic> json) {
    return MainScreen(
      header: MainScreenHeader.fromJson((json[r'''header'''] as Map).cast<String, dynamic>()),
      floatingButton: MainScreenFloatingButton.fromJson((json[r'''floating_button'''] as Map).cast<String, dynamic>()),
    );
  }
  final MainScreenHeader header;

  final MainScreenFloatingButton floatingButton;

  Map<String, Object> get _content => {
        r'''header''': header,
        r'''floating_button''': floatingButton,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

class MainScreenHeader {
  const MainScreenHeader({
    required this.title,
  });
  factory MainScreenHeader.fromJson(Map<String, dynamic> json) {
    return MainScreenHeader(
      title: (json[r'''title''']['value'] ?? '').toString(),
    );
  }

  /// Morning greeting when the Captain wakes up Morning greeting when the Captain wakes up Morning greeting when the Captain wakes up
  final String title;

  Map<String, Object> get _content => {
        r'''title''': title,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

class MainScreenFloatingButton {
  const MainScreenFloatingButton({
    required this.tooltip,
  });
  factory MainScreenFloatingButton.fromJson(Map<String, dynamic> json) {
    return MainScreenFloatingButton(
      tooltip: (json[r'''tooltip'''] ?? '').toString(),
    );
  }
  final String tooltip;
  Map<String, Object> get _content => {
        r'''tooltip''': tooltip,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

class Logbook {
  const Logbook({
    required this.header,
    required this.details,
    required this.summary,
    required this.alerts,
  });
  factory Logbook.fromJson(Map<String, dynamic> json) {
    return Logbook(
      header: (json[r'''header''']['value'] ?? '').toString(),
      details: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''details''',
        zero: json[r'''details''']['zero'] == null
            ? null
            : json[r'''details''']['zero'].toString().replaceAll(r'${howMany}', howMany.toString()),
        one: (json[r'''details''']['one'] ?? '').toString().replaceAll(r'${howMany}', howMany.toString()),
        two: json[r'''details''']['two'] == null
            ? null
            : json[r'''details''']['two'].toString().replaceAll(r'${howMany}', howMany.toString()),
        few: json[r'''details''']['few'] == null
            ? null
            : json[r'''details''']['few'].toString().replaceAll(r'${howMany}', howMany.toString()),
        many: json[r'''details''']['many'] == null
            ? null
            : json[r'''details''']['many'].toString().replaceAll(r'${howMany}', howMany.toString()),
        other: (json[r'''details''']['other'] ?? '').toString().replaceAll(r'${howMany}', howMany.toString()),
        precision: precision,
      ),
      summary: (json[r'''summary''']['value'] ?? '').toString(),
      alerts: LogbookAlerts.fromJson((json[r'''alerts'''] as Map).cast<String, dynamic>()),
    );
  }

  /// Title for the nightly log section Title for the nightly log section Title for the nightly log section
  final String header;

  final String Function(int howMany, {int? precision}) details;

  /// Brief summary of nightly activities Brief summary of nightly activities Brief summary of nightly activities
  final String summary;

  final LogbookAlerts alerts;

  Map<String, Object> get _content => {
        r'''header''': header,
        r'''details''': details,
        r'''summary''': summary,
        r'''alerts''': alerts,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

class LogbookAlerts {
  const LogbookAlerts({
    required this.title,
    required this.alertMessage,
    required this.alerts,
  });
  factory LogbookAlerts.fromJson(Map<String, dynamic> json) {
    return LogbookAlerts(
      title: (json[r'''title'''] ?? '').toString(),
      alertMessage: (Gender gender, {required String alerts}) => Intl.gender(
        gender.name,
        name: r'''alert_message''',
        female: json[r'''alert_message''']['female'] == null
            ? null
            : json[r'''alert_message''']['female']
                .toString()
                .replaceAll(r'${alerts}', alerts)
                .replaceAll(_variableRegExp, ''),
        male: json[r'''alert_message''']['male'] == null
            ? null
            : json[r'''alert_message''']['male']
                .toString()
                .replaceAll(r'${alerts}', alerts)
                .replaceAll(_variableRegExp, ''),
        other: (json[r'''alert_message''']['other'] ?? '')
            .toString()
            .replaceAll(r'${alerts}', alerts)
            .replaceAll(_variableRegExp, ''),
      ),
      alerts: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''alerts''',
        zero: json[r'''alerts''']['zero'] == null
            ? null
            : json[r'''alerts''']['zero'].toString().replaceAll(r'${howMany}', howMany.toString()),
        one: (json[r'''alerts''']['one'] ?? '').toString().replaceAll(r'${howMany}', howMany.toString()),
        two: json[r'''alerts''']['two'] == null
            ? null
            : json[r'''alerts''']['two'].toString().replaceAll(r'${howMany}', howMany.toString()),
        few: json[r'''alerts''']['few'] == null
            ? null
            : json[r'''alerts''']['few'].toString().replaceAll(r'${howMany}', howMany.toString()),
        many: json[r'''alerts''']['many'] == null
            ? null
            : json[r'''alerts''']['many'].toString().replaceAll(r'${howMany}', howMany.toString()),
        other: (json[r'''alerts''']['other'] ?? '').toString().replaceAll(r'${howMany}', howMany.toString()),
        precision: precision,
      ),
    );
  }
  final String title;

  final String Function(Gender gender, {required String alerts}) alertMessage;

  final String Function(int howMany, {int? precision}) alerts;

  Map<String, Object> get _content => {
        r'''title''': title,
        r'''alert_message''': alertMessage,
        r'''alerts''': alerts,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

class LocalizationMessages {
  LocalizationMessages({
    required this.appTitle,
    required this.locale,
    required this.mainScreen,
    required this.eventsLogged,
    required this.officerReport,
    required this.logbook,
    required this.captainGreeting,
  });
  factory LocalizationMessages.fromJson(Map<String, dynamic> json) {
    return LocalizationMessages(
      appTitle: AppTitle.fromJson((json[r'''app_title'''] as Map).cast<String, dynamic>()),
      locale: $Locale.fromJson((json[r'''locale'''] as Map).cast<String, dynamic>()),
      mainScreen: MainScreen.fromJson((json[r'''main_screen'''] as Map).cast<String, dynamic>()),
      eventsLogged: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''events_logged''',
        zero: json[r'''events_logged''']['zero'] == null
            ? null
            : json[r'''events_logged''']['zero'].toString().replaceAll(r'${howMany}', howMany.toString()),
        one: (json[r'''events_logged''']['one'] ?? '').toString().replaceAll(r'${howMany}', howMany.toString()),
        two: json[r'''events_logged''']['two'] == null
            ? null
            : json[r'''events_logged''']['two'].toString().replaceAll(r'${howMany}', howMany.toString()),
        few: json[r'''events_logged''']['few'] == null
            ? null
            : json[r'''events_logged''']['few'].toString().replaceAll(r'${howMany}', howMany.toString()),
        many: json[r'''events_logged''']['many'] == null
            ? null
            : json[r'''events_logged''']['many'].toString().replaceAll(r'${howMany}', howMany.toString()),
        other: (json[r'''events_logged''']['other'] ?? '').toString().replaceAll(r'${howMany}', howMany.toString()),
        precision: precision,
      ),
      officerReport: (Gender gender) => Intl.gender(
        gender.name,
        name: r'''officer_report''',
        female: json[r'''officer_report''']['female'] == null ? null : json[r'''officer_report''']['female'].toString(),
        male: json[r'''officer_report''']['male'] == null ? null : json[r'''officer_report''']['male'].toString(),
        other: (json[r'''officer_report''']['other'] ?? '').toString(),
      ),
      logbook: Logbook.fromJson((json[r'''logbook'''] as Map).cast<String, dynamic>()),
      captainGreeting: ({required String username}) => (json[r'''captain_greeting'''] ?? '')
          .toString()
          .replaceAll(r'${username}', username)
          .replaceAll(_variableRegExp, ''),
    );
  }
  final AppTitle appTitle;

  final $Locale locale;

  final MainScreen mainScreen;

  /// Number of events that occurred while the Captain was asleep Number of events that occurred while the Captain was asleep Number of events that occurred while the Captain was asleep
  final String Function(int howMany, {int? precision}) eventsLogged;

  /// Morning report from the officer to the Captain based on gender Morning report from the officer to the Captain based on gender Morning report from the officer to the Captain based on gender
  final String Function(Gender gender) officerReport;

  final Logbook logbook;

  final String Function({required String username}) captainGreeting;

  Map<String, Object> get _content => {
        r'''app_title''': appTitle,
        r'''locale''': locale,
        r'''main_screen''': mainScreen,
        r'''events_logged''': eventsLogged,
        r'''officer_report''': officerReport,
        r'''logbook''': logbook,
        r'''captain_greeting''': captainGreeting,
      };
  T getContent<T>(String key) {
    final Object? value = _content[key];
    if (value is T) {
      return value;
    }
    throw ArgumentError('Not found content for the key $key with type $T');
  }

  dynamic operator [](Object? key) {
    return _content[key];
  }
}

final LocalizationMessages en = LocalizationMessages(
  appTitle: AppTitle(
    title: ({required String today}) => '''Ship Log, ${today}''',
    dateFormat: '''MM/dd/yyyy''',
  ),
  locale: $Locale(
    defaultLocale: ({required String locale}) => '''Default locale: ${locale}''',
    selectedLocale: ({required String locale}) => '''Selected locale: ${locale}''',
  ),
  mainScreen: MainScreen(
    header: MainScreenHeader(
      title: '''Good morning, Captain!''',
    ),
    floatingButton: MainScreenFloatingButton(
      tooltip: '''Add Event''',
    ),
  ),
  eventsLogged: (int howMany, {int? precision}) => Intl.plural(
    howMany,
    name: r'''events_logged''',
    zero: '''No events occurred during your sleep''',
    one: '''${howMany} event occurred during your sleep''',
    two: '''${howMany} events occurred during your sleep''',
    few: '''${howMany} events occurred during your sleep''',
    many: '''Many events occurred during your sleep''',
    other: '''${howMany} events occurred during your sleep''',
    precision: precision,
  ),
  officerReport: (Gender gender) => Intl.gender(
    gender.name,
    name: r'''officer_report''',
    female: '''Good morning, Ma'am! All systems are operational.''',
    male: '''Good morning, Sir! All systems are operational.''',
    other: '''Good morning! All systems are operational.''',
  ),
  logbook: Logbook(
    header: '''Nightly Log''',
    details: (int howMany, {int? precision}) => Intl.plural(
      howMany,
      name: r'''details''',
      one: '''There was ${howMany} incident reported.''',
      other: '''There were ${howMany} incidents reported.''',
      precision: precision,
    ),
    summary: '''Summary of all activities during the night.''',
    alerts: LogbookAlerts(
      title: '''Alerts''',
      alertMessage: (Gender gender, {required String alerts}) => Intl.gender(
        gender.name,
        name: r'''alert_message''',
        female: '''Captainess, you received ${alerts}.''',
        male: '''Captain, you received ${alerts}.''',
        other: '''Captainx, you received ${alerts}.''',
      ),
      alerts: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''alerts''',
        one: '''${howMany} new alert''',
        other: '''${howMany} new alerts''',
        precision: precision,
      ),
    ),
  ),
  captainGreeting: ({required String username}) => '''Welcome back, Captain ${username}!''',
);
final LocalizationMessages en_CA = LocalizationMessages(
  appTitle: AppTitle(
    title: ({required String today}) => '''Ship Log, ${today}''',
    dateFormat: '''dd/MM/yyyy''',
  ),
  locale: $Locale(
    defaultLocale: ({required String locale}) => '''Default locale: ${locale}''',
    selectedLocale: ({required String locale}) => '''Selected locale: ${locale}''',
  ),
  mainScreen: MainScreen(
    header: MainScreenHeader(
      title: '''Good morning, Captain!''',
    ),
    floatingButton: MainScreenFloatingButton(
      tooltip: '''Add Event''',
    ),
  ),
  eventsLogged: (int howMany, {int? precision}) => Intl.plural(
    howMany,
    name: r'''events_logged''',
    zero: '''No events occurred during your sleep''',
    one: '''${howMany} event occurred during your sleep''',
    two: '''${howMany} events occurred during your sleep''',
    few: '''${howMany} events occurred during your sleep''',
    many: '''Many events occurred during your sleep''',
    other: '''${howMany} events occurred during your sleep''',
    precision: precision,
  ),
  officerReport: (Gender gender) => Intl.gender(
    gender.name,
    name: r'''officer_report''',
    female: '''Good morning, Ma'am! All systems are operational.''',
    male: '''Good morning, Sir! All systems are operational.''',
    other: '''Good morning! All systems are operational.''',
  ),
  logbook: Logbook(
    header: '''Nightly Log''',
    details: (int howMany, {int? precision}) => Intl.plural(
      howMany,
      name: r'''details''',
      one: '''There was ${howMany} incident reported.''',
      other: '''There were ${howMany} incidents reported.''',
      precision: precision,
    ),
    summary: '''Summary of all activities during the night.''',
    alerts: LogbookAlerts(
      title: '''Alerts''',
      alertMessage: (Gender gender, {required String alerts}) => Intl.gender(
        gender.name,
        name: r'''alert_message''',
        female: '''Captainess, you received ${alerts}.''',
        male: '''Captain, you received ${alerts}.''',
        other: '''Captainx, you received ${alerts}.''',
      ),
      alerts: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''alerts''',
        one: '''${howMany} new alert''',
        other: '''${howMany} new alerts''',
        precision: precision,
      ),
    ),
  ),
  captainGreeting: ({required String username}) => '''Welcome back, Captain ${username}!''',
);
final LocalizationMessages fr_FR = LocalizationMessages(
  appTitle: AppTitle(
    title: ({required String today}) => '''Ship Log, ${today}''',
    dateFormat: '''MM/dd/yyyy''',
  ),
  locale: $Locale(
    defaultLocale: ({required String locale}) => '''Langue par défaut : ${locale}''',
    selectedLocale: ({required String locale}) => '''Langue sélectionnée : ${locale}''',
  ),
  mainScreen: MainScreen(
    header: MainScreenHeader(
      title: '''Bonjour, Commandant !''',
    ),
    floatingButton: MainScreenFloatingButton(
      tooltip: '''Add Event''',
    ),
  ),
  eventsLogged: (int howMany, {int? precision}) => Intl.plural(
    howMany,
    name: r'''events_logged''',
    zero: '''No events occurred during your sleep''',
    one: '''${howMany} event occurred during your sleep''',
    two: '''${howMany} events occurred during your sleep''',
    few: '''${howMany} events occurred during your sleep''',
    many: '''De nombreux événements se sont produits pendant votre sommeil''',
    other: '''${howMany} events occurred during your sleep''',
    precision: precision,
  ),
  officerReport: (Gender gender) => Intl.gender(
    gender.name,
    name: r'''officer_report''',
    female: '''Bonjour, Madame ! Tous les systèmes sont opérationnels.''',
    male: '''Bonjour, Monsieur ! Tous les systèmes sont opérationnels.''',
    other: '''Bonjour ! Tous les systèmes sont opérationnels.''',
  ),
  logbook: Logbook(
    header: '''Journal de Nuit''',
    details: (int howMany, {int? precision}) => Intl.plural(
      howMany,
      name: r'''details''',
      one: '''There was ${howMany} incident reported.''',
      other: '''There were ${howMany} incidents reported.''',
      precision: precision,
    ),
    summary: '''Résumé de toutes les activités nocturnes.''',
    alerts: LogbookAlerts(
      title: '''Alerts''',
      alertMessage: (Gender gender, {required String alerts}) => Intl.gender(
        gender.name,
        name: r'''alert_message''',
        female: '''Commandante, vous avez reçu ${alerts}.''',
        male: '''Commandant, vous avez reçu ${alerts}.''',
        other: '''Captainx, you received ${alerts}.''',
      ),
      alerts: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''alerts''',
        one: '''${howMany} new alert''',
        other: '''${howMany} new alerts''',
        precision: precision,
      ),
    ),
  ),
  captainGreeting: ({required String username}) => '''Bon retour, Commandant ${username}!''',
);
final LocalizationMessages fr_CA = LocalizationMessages(
  appTitle: AppTitle(
    title: ({required String today}) => '''Journal de Bord, ${today}''',
    dateFormat: '''yyyy-MM-dd''',
  ),
  locale: $Locale(
    defaultLocale: ({required String locale}) => '''Locale par défaut : ${locale}''',
    selectedLocale: ({required String locale}) => '''Locale sélectionnée : ${locale}''',
  ),
  mainScreen: MainScreen(
    header: MainScreenHeader(
      title: '''Bonjour, Capitaine!''',
    ),
    floatingButton: MainScreenFloatingButton(
      tooltip: '''Ajouter un Événement''',
    ),
  ),
  eventsLogged: (int howMany, {int? precision}) => Intl.plural(
    howMany,
    name: r'''events_logged''',
    zero: '''Aucun événement ne s'est produit pendant votre sommeil''',
    one: '''${howMany} événement s'est produit pendant votre sommeil''',
    two: '''${howMany} événements se sont produits pendant votre sommeil''',
    few: '''${howMany} événements se sont produits pendant votre sommeil''',
    many: '''Beaucoup d'événements se sont produits pendant votre sommeil''',
    other: '''${howMany} événements se sont produits pendant votre sommeil''',
    precision: precision,
  ),
  officerReport: (Gender gender) => Intl.gender(
    gender.name,
    name: r'''officer_report''',
    female: '''Bonjour, Madame! Tous les systèmes sont opérationnels.''',
    male: '''Bonjour, Monsieur! Tous les systèmes sont opérationnels.''',
    other: '''Bonjour! Tous les systèmes sont opérationnels.''',
  ),
  logbook: Logbook(
    header: '''Journal de Nuit''',
    details: (int howMany, {int? precision}) => Intl.plural(
      howMany,
      name: r'''details''',
      one: '''Il y a eu ${howMany} incident signalé.''',
      other: '''Il y a eu ${howMany} incidents signalés.''',
      precision: precision,
    ),
    summary: '''Résumé de toutes les activités pendant la nuit.''',
    alerts: LogbookAlerts(
      title: '''Alertes''',
      alertMessage: (Gender gender, {required String alerts}) => Intl.gender(
        gender.name,
        name: r'''alert_message''',
        female: '''Capitaine, vous avez reçu ${alerts}.''',
        male: '''Capitaine, vous avez reçu ${alerts}.''',
        other: '''Capitaine, vous avez reçu ${alerts}.''',
      ),
      alerts: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''alerts''',
        one: '''${howMany} nouvelle alerte''',
        other: '''${howMany} nouvelles alertes''',
        precision: precision,
      ),
    ),
  ),
  captainGreeting: ({required String username}) => '''Bon retour, Capitaine ${username}!''',
);
final LocalizationMessages ru_RU = LocalizationMessages(
  appTitle: AppTitle(
    title: ({required String today}) => '''Бортовой Журнал, ${today}''',
    dateFormat: '''dd-MM-yyyy''',
  ),
  locale: $Locale(
    defaultLocale: ({required String locale}) => '''Язык по умолчанию: ${locale}''',
    selectedLocale: ({required String locale}) => '''Выбранный язык: ${locale}''',
  ),
  mainScreen: MainScreen(
    header: MainScreenHeader(
      title: '''Доброе утро, Капитан!''',
    ),
    floatingButton: MainScreenFloatingButton(
      tooltip: '''Добавить событие''',
    ),
  ),
  eventsLogged: (int howMany, {int? precision}) => Intl.plural(
    howMany,
    name: r'''events_logged''',
    zero: '''Во время вашего сна не произошло никаких событий''',
    one: '''Произошло ${howMany} событие во время вашего сна''',
    two: '''Произошло ${howMany} события во время вашего сна''',
    few: '''Произошло ${howMany} события во время вашего сна''',
    many: '''Произошло много событий во время вашего сна''',
    other: '''Произошло ${howMany} событий во время вашего сна''',
    precision: precision,
  ),
  officerReport: (Gender gender) => Intl.gender(
    gender.name,
    name: r'''officer_report''',
    female: '''Доброе утро, Мадам! Все системы работают нормально.''',
    male: '''Доброе утро, Сэр! Все системы работают нормально.''',
    other: '''Доброе утро! Все системы работают нормально.''',
  ),
  logbook: Logbook(
    header: '''Ночной журнал''',
    details: (int howMany, {int? precision}) => Intl.plural(
      howMany,
      name: r'''details''',
      one: '''Было сообщено о ${howMany} инциденте.''',
      other: '''Было сообщено о ${howMany} инцидентах.''',
      precision: precision,
    ),
    summary: '''Краткий обзор всех ночных активностей.''',
    alerts: LogbookAlerts(
      title: '''Оповещения''',
      alertMessage: (Gender gender, {required String alerts}) => Intl.gender(
        gender.name,
        name: r'''alert_message''',
        female: '''Капитанка, вы получили ${alerts}.''',
        male: '''Капитан, вы получили ${alerts}.''',
        other: '''Капитанн, вы получили ${alerts}.''',
      ),
      alerts: (int howMany, {int? precision}) => Intl.plural(
        howMany,
        name: r'''alerts''',
        one: '''${howMany} новое оповещение''',
        other: '''${howMany} новых оповещений''',
        precision: precision,
      ),
    ),
  ),
  captainGreeting: ({required String username}) => '''Добро пожаловать обратно, Капитан ${username}!''',
);
final Map<Locale, LocalizationMessages> _languageMap = {
  Locale('en'): en,
  Locale('en', 'CA'): en_CA,
  Locale('fr', 'FR'): fr_FR,
  Locale('fr', 'CA'): fr_CA,
  Locale('ru', 'RU'): ru_RU,
};

final Map<Locale, LocalizationMessages> _providersLanguagesMap = {};

class EasiestLocalizationDelegate extends LocalizationsDelegate<LocalizationMessages> {
  EasiestLocalizationDelegate({
    List<LocalizationProvider<LocalizationMessages>> providers = const [],
  }) {
    providers.forEach(registerProvider);
  }

  final List<LocalizationProvider<LocalizationMessages>> _providers = [];

  void registerProvider(LocalizationProvider<LocalizationMessages> provider) {
    _providers.add(provider);
  }

  @override
  bool isSupported(Locale locale) {
    final bool supportedByProviders = _providers.any((LocalizationProvider value) => value.canLoad(locale));
    if (supportedByProviders) {
      return true;
    }
    final bool hasInLanguageMap = _languageMap.containsKey(locale);
    if (hasInLanguageMap) {
      return true;
    }
    for (final Locale supportedLocale in _languageMap.keys) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  Future<LocalizationMessages> load(Locale locale) async {
    Intl.defaultLocale = locale.toString();

    LocalizationProvider<LocalizationMessages>? localizationProvider;

    for (final LocalizationProvider<LocalizationMessages> provider in _providers) {
      if (provider.canLoad(locale)) {
        localizationProvider = provider;
        break;
      }
    }

    LocalizationMessages? localeContent;

    if (localizationProvider != null) {
      try {
        localeContent = await localizationProvider.fetchLocalization(locale);
        _providersLanguagesMap[locale] = localeContent;
      } catch (error, stackTrace) {
        log('Error on loading localization with provider "${localizationProvider.name}"',
            error: error, stackTrace: stackTrace);
      }
    }

    localeContent ??= _loadLocalLocale(locale) ?? _languageMap.values.first;
    return localeContent;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationMessages> old) => old != this;
}

class Messages {
  static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages)!;

  static LocalizationMessages? getContent(Locale locale) => _loadLocalLocale(locale);

  static LocalizationMessages get el {
    final String? defaultLocaleString = Intl.defaultLocale;
    final List<String> localeParticles = defaultLocaleString == null ? [] : defaultLocaleString.split(RegExp(r'[_-]'));
    final Locale? defaultLocale = localeParticles.isEmpty
        ? null
        : Locale(localeParticles.first, localeParticles.length > 1 ? localeParticles[1] : null);
    LocalizationMessages? localeContent = _providersLanguagesMap[defaultLocale];
    localeContent ??= _languageMap[defaultLocale] ?? _languageMap.values.first;
    return localeContent;
  }
}

LocalizationMessages? _loadLocalLocale(Locale locale) {
  final bool hasInLanguageMap = _languageMap.containsKey(locale);
  if (hasInLanguageMap) {
    return _languageMap[locale];
  }
  for (final Locale supportedLocale in _languageMap.keys) {
    if (supportedLocale.languageCode == locale.languageCode) {
      return _languageMap[supportedLocale];
    }
  }
  return null;
}

LocalizationMessages get el => Messages.el;

final List<LocalizationsDelegate> localizationsDelegates = [
  EasiestLocalizationDelegate(),
  ...GlobalMaterialLocalizations.delegates,
];

List<LocalizationsDelegate> localizationsDelegatesWithProviders(
    List<LocalizationProvider<LocalizationMessages>> providers) {
  return [
    EasiestLocalizationDelegate(providers: providers),
    ...GlobalMaterialLocalizations.delegates,
  ];
}

// Supported locales: en, en_CA, fr_FR, fr_CA, ru_RU
const List<Locale> supportedLocales = [
  Locale('en'),
  Locale('en', 'CA'),
  Locale('fr', 'FR'),
  Locale('fr', 'CA'),
  Locale('ru', 'RU'),
];

List<Locale> supportedLocalesWithProviders(List<LocalizationProvider<LocalizationMessages>> providers) => [
      for (final LocalizationProvider provider in providers) ...provider.supportedLocales,
      ...supportedLocales,
    ];

extension EasiestLocalizationContext on BuildContext {
  LocalizationMessages get el {
    return Messages.of(this);
  }

  dynamic tr(String key) => key.tr();
}

extension EasiestLocalizationString on String {
  dynamic get el {
    final List<String> groupOfStrings = contains('.') ? split('.') : [this];
    dynamic targetContent;
    for (int i = 0; i < groupOfStrings.length; i++) {
      final String key = groupOfStrings[i];
      if (i == 0) {
        targetContent = Messages.el[key];
        if (targetContent == null) {
          return '';
        }
      } else {
        try {
          targetContent = targetContent[key];
          if (targetContent == null) {
            return '';
          }
        } catch (error) {
          if (kDebugMode) {
            print(
                '[ERROR] Incorrect retrieving of value by key "$key" from value "$targetContent"; Original key was "$this"');
          }
          return '';
        }
      }
    }
    return targetContent;
  }

  dynamic tr() => el;
}

dynamic tr(String key) => key.tr();
