import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? esText = '',
  }) =>
      [enText, frText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '7kjcby5i': {
      'en': 'Developer Note (delete this)',
      'es': 'Nota del desarrollador (eliminar esto)',
      'fr': 'Note du développeur (supprimez ceci)',
    },
    '94yt6c0f': {
      'en':
          'You can adjust the navigation items in the left navigation by editing the component. The selected state is triggered by the "selectedNav" parameter in the sideNav component. ',
      'es':
          'Puede ajustar los elementos de navegación en la navegación izquierda editando el componente. El estado seleccionado se activa mediante el parámetro "selectedNav" en el componente sideNav.',
      'fr':
          'Vous pouvez ajuster les éléments de navigation dans la navigation de gauche en modifiant le composant. L\'état sélectionné est déclenché par le paramètre "selectedNav" dans le composant sideNav.',
    },
    '92abtog7': {
      'en': 'Dashboard Application',
      'es': 'Aplicación de panel',
      'fr': 'Application de tableau de bord',
    },
    '1s8p1965': {
      'en':
          'You will first need to increase the screen size to tablet or desktop.',
      'es':
          'Primero deberá aumentar el tamaño de la pantalla a tableta o computadora de escritorio.',
      'fr':
          'Vous devrez d’abord augmenter la taille de l’écran sur tablette ou ordinateur de bureau.',
    },
    'p7dfj1mo': {
      'en': 'Configuration',
      'es': '',
      'fr': '',
    },
    '56qb0ujv': {
      'en': 'Shift',
      'es': '',
      'fr': '',
    },
    'x9ds9y63': {
      'en': 'Line',
      'es': '',
      'fr': '',
    },
    'ggmmmegm': {
      'en': 'Product',
      'es': '',
      'fr': '',
    },
    '83hoagl8': {
      'en': 'Navigate to Form',
      'es': '',
      'fr': '',
    },
    'lequst8u': {
      'en': 'Completed Checks',
      'es': '',
      'fr': '',
    },
    'mj3k5uqf': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LogInRegister
  {
    'jrfdoep7': {
      'en': 'Operators',
      'es': 'Operadores',
      'fr': 'Les opérateurs',
    },
    'k89623ou': {
      'en': 'Operator Sign In',
      'es': 'Iniciar sesión del operador',
      'fr': 'Connexion opérateur',
    },
    '51ueyicd': {
      'en': 'Ralph',
      'es': 'ralph',
      'fr': 'Ralph',
    },
    'mm0oc64p': {
      'en': 'Name...',
      'es': 'Nombre...',
      'fr': 'Nom...',
    },
    '0bfogj22': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'yspoa2kl': {
      'en': 'Line 2',
      'es': 'Opción',
      'fr': 'Option',
    },
    'l6f6a4kx': {
      'en': 'Line...',
      'es': 'Línea...',
      'fr': 'Doubler...',
    },
    '4yb07sxg': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '8dppo8n6': {
      'en': 'St. Bonaventure (8a-4p)',
      'es': 'Opción',
      'fr': 'Option',
    },
    'y71rpl3s': {
      'en': 'Shift...',
      'es': 'Cambio...',
      'fr': 'Changement...',
    },
    'o9i399sb': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    'xqmysl5m': {
      'en': 'Soil',
      'es': 'Opción',
      'fr': 'Option',
    },
    '6yrhoxki': {
      'en': 'Product...',
      'es': 'Producto...',
      'fr': 'Produit...',
    },
    '6p6bfy1i': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'fr': 'Rechercher un article...',
    },
    '2z74pwrc': {
      'en': 'Administrators',
      'es': 'Administradores',
      'fr': 'Administrateurs',
    },
    'gazlqgj0': {
      'en': 'Administrator Sign In',
      'es': 'Iniciar sesión de administrador',
      'fr': 'Connexion Administrateur',
    },
    'xs3xrezt': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'lvlsbaly': {
      'en': 'demo@scotts.poc',
      'es': 'demo@scotts.poc',
      'fr': 'démo@scotts.poc',
    },
    '11v833sn': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'z9x7gnmn': {
      'en': 'demotest!',
      'es': 'degradar!',
      'fr': 'rétrogradé !',
    },
    'o3dhx3xo': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // StartupChecklist
  {
    'iqk7fhsj': {
      'en':
          'Please carefully review each condition and check whether the condition failed or passed.',
      'es':
          'Revise cuidadosamente cada condición y verifique si la condición falló o pasó.',
      'fr':
          'Veuillez examiner attentivement chaque condition et vérifier si la condition a échoué ou réussi.',
    },
    '9dbdwo2a': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // MIPBagCheck
  {
    '72f23d9g': {
      'en': 'MIP Check',
      'es': 'Verificación MIP',
      'fr': 'Vérification MIP',
    },
    '0n6p6wky': {
      'en': '5-Bag',
      'es': '5 bolsas',
      'fr': '5-Sac',
    },
    'tugf892n': {
      'en': 'Bag 1:',
      'es': '',
      'fr': '',
    },
    'xod00sj1': {
      'en': 'Bag 2:',
      'es': '',
      'fr': '',
    },
    'e80iw7w6': {
      'en': 'Bag 3:',
      'es': '',
      'fr': '',
    },
    'go6nvg1t': {
      'en': 'Bag 4:',
      'es': '',
      'fr': '',
    },
    'wql2lxsx': {
      'en': 'Bag 5:',
      'es': '',
      'fr': '',
    },
    'o8f6p5ya': {
      'en': 'Submit',
      'es': 'Entregar',
      'fr': 'Soumettre',
    },
    '26iyzv6z': {
      'en': '12-Bag',
      'es': '12 bolsas',
      'fr': '12-Sac',
    },
    'cwi21xpj': {
      'en': 'Bag 1:',
      'es': '',
      'fr': '',
    },
    'ed5nu2fm': {
      'en': 'Bag 2:',
      'es': '',
      'fr': '',
    },
    'hczr7q4k': {
      'en': 'Bag 3:',
      'es': '',
      'fr': '',
    },
    'l7zc3iti': {
      'en': 'Bag 4:',
      'es': '',
      'fr': '',
    },
    'mofgybsw': {
      'en': 'Bag 5:',
      'es': '',
      'fr': '',
    },
    'vbcol2tz': {
      'en': 'Bag 5:',
      'es': '',
      'fr': '',
    },
    'lpalx20h': {
      'en': 'Bag 7:',
      'es': '',
      'fr': '',
    },
    '52cdwltt': {
      'en': 'Bag 8:',
      'es': '',
      'fr': '',
    },
    '9sr7qa98': {
      'en': 'Bag 9:',
      'es': '',
      'fr': '',
    },
    'jp8jr6ck': {
      'en': 'Bag 10:',
      'es': '',
      'fr': '',
    },
    'hwuadith': {
      'en': 'Bag 11:',
      'es': '',
      'fr': '',
    },
    '1fbngyi9': {
      'en': 'Bag 12:',
      'es': '',
      'fr': '',
    },
    'bsr4luy5': {
      'en': 'Submit',
      'es': 'Entregar',
      'fr': 'Soumettre',
    },
    'zk8f9ujq': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // History
  {
    't4adi15t': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    'xvka78ih': {
      'en': 'Here is a summation of form completion history.',
      'es': 'Aquí hay un resumen del historial de finalización de formularios.',
      'fr': 'Voici un résumé de l’historique d’achèvement du formulaire.',
    },
    'ji7mci3u': {
      'en': 'Form Type',
      'es': 'Tipo de formulario',
      'fr': 'Type de formulaire',
    },
    'b7k49nz1': {
      'en': 'DateTime Submitted',
      'es': 'Fecha y hora de envío',
      'fr': 'DateHeure Soumis',
    },
    '6215muit': {
      'en': 'Summary',
      'es': 'Resumen',
      'fr': 'Résumé',
    },
    'ntgubadf': {
      'en': '  MIP',
      'es': 'PIM',
      'fr': 'MIP',
    },
    'md0le75g': {
      'en': '   1/31/24 8:35 AM',
      'es': '31/01/24 8:35 a.m.',
      'fr': '31/01/24 8h35',
    },
    'b8puq1zv': {
      'en': 'View/Edit Data',
      'es': 'Ver/Editar datos',
      'fr': 'Afficher/Modifier les données',
    },
    '7q76xp8n': {
      'en': ' 5-Bag',
      'es': '5 bolsas',
      'fr': '5-Sac',
    },
    'jlqqsp0o': {
      'en': ' 1/31/24 8:54 AM',
      'es': '31/01/24 8:54 a.m.',
      'fr': '31/01/24 8h54',
    },
    'wofl7ls9': {
      'en': 'View/Edit Data',
      'es': 'Ver/Editar datos',
      'fr': 'Afficher/Modifier les données',
    },
    'bcrccp51': {
      'en': '12-Bag',
      'es': '12 bolsas',
      'fr': '12-Sac',
    },
    '2pnu7op2': {
      'en': '1/31/24 9:04 AM',
      'es': '31/01/24 9:04 a.m.',
      'fr': '31/01/24 9h04',
    },
    'icr6jtfq': {
      'en': 'View/Edit Data',
      'es': 'Ver/Editar datos',
      'fr': 'Afficher/Modifier les données',
    },
    'udpbvgr1': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // MIPBagCheckEdit
  {
    '6iennpk9': {
      'en': 'MIP Check',
      'es': 'Verificación MIP',
      'fr': 'Vérification MIP',
    },
    'oe6ku3ai': {
      'en': '5-Bag',
      'es': '5 bolsas',
      'fr': '5-Sac',
    },
    '0fs0tda8': {
      'en': 'Submit',
      'es': 'Entregar',
      'fr': 'Soumettre',
    },
    'iz8bqkuj': {
      'en': '12-Bag',
      'es': '12 bolsas',
      'fr': '12-Sac',
    },
    'oc95ja4t': {
      'en': 'Submit',
      'es': 'Entregar',
      'fr': 'Soumettre',
    },
    'yetcu1kd': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Settings
  {
    'b8xeycjl': {
      'en': 'Language',
      'es': 'Idioma:',
      'fr': 'Langue:',
    },
    'hyia3xdg': {
      'en': 'Brightness Setting',
      'es': '',
      'fr': '',
    },
    'c84ewztx': {
      'en': 'Light Mode',
      'es': '',
      'fr': '',
    },
    'de3owyv4': {
      'en': 'Dark Mode',
      'es': '',
      'fr': '',
    },
    '63htuntc': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // PageTemplate
  {
    'be2h9kch': {
      'en': 'Title',
      'es': '',
      'fr': '',
    },
    '8pik5mte': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // ManageForms
  {
    '1zordars': {
      'en': 'Manage Forms',
      'es': '',
      'fr': '',
    },
    'd6gugpcp': {
      'en': 'St. Bonaventure',
      'es': '',
      'fr': '',
    },
    'tc6hf8sf': {
      'en': 'Plant',
      'es': '',
      'fr': '',
    },
    'ew1i93rs': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    't4qybaur': {
      'en': 'Soil',
      'es': '',
      'fr': '',
    },
    'x8bg480n': {
      'en': 'Product',
      'es': '',
      'fr': '',
    },
    'iqa9n5kf': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'h6q60bu5': {
      'en': 'MIP Check',
      'es': '',
      'fr': '',
    },
    'f5e86jy2': {
      'en': 'Startup Checklist',
      'es': '',
      'fr': '',
    },
    'bi655eue': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // sideNav
  {
    'enolgrho': {
      'en': 'Home',
      'es': 'Lista de verificación de inicio',
      'fr': 'Liste de contrôle de démarrage',
    },
    'wjzox2xg': {
      'en': 'Navigation',
      'es': 'Navegación de plataforma',
      'fr': 'Navigation sur la plateforme',
    },
    'n4ecvuzy': {
      'en': 'MIP Check Forms',
      'es': 'Formularios de verificación MIP',
      'fr': 'Formulaires de contrôle MIP',
    },
    'ygixzv89': {
      'en': 'Manage Users',
      'es': '',
      'fr': '',
    },
    'geyc5fra': {
      'en': 'Manage Forms',
      'es': 'Administrar formularios',
      'fr': 'Gérer les formulaires',
    },
    'oggyxijk': {
      'en': 'Manage Plants',
      'es': 'Administrar plantas',
      'fr': 'Gérer les plantes',
    },
    'xvluj6jh': {
      'en': 'Startup Checklist',
      'es': '',
      'fr': '',
    },
    'j67iy8h5': {
      'en': 'MIP / Bag Check',
      'es': 'MIP/Revisión de equipaje',
      'fr': 'MIP / Contrôle des bagages',
    },
    'sujgne6m': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    '91cprl4l': {
      'en': 'Settings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    '5fk0tdq0': {
      'en': 'Settings',
      'es': '',
      'fr': '',
    },
    'enxoih9j': {
      'en': 'MIP Time',
      'es': 'Estado de sincronización',
      'fr': 'Statut de synchronisation',
    },
    'jyqj2ru3': {
      'en': ': ',
      'es': ':',
      'fr': ':',
    },
    '4501u0kf': {
      'en': 'Synced',
      'es': 'Sincronizado',
      'fr': 'Synchronisé',
    },
    '7jhhihew': {
      'en': 'Sync Status',
      'es': '',
      'fr': '',
    },
    'wufpbfvy': {
      'en': ': ',
      'es': '',
      'fr': '',
    },
    '6i1tu3dn': {
      'en': 'Synced',
      'es': '',
      'fr': '',
    },
    'eo6dsups': {
      'en': 'Administrator',
      'es': 'Administrador',
      'fr': 'Administrateur',
    },
    'rdxzh4yl': {
      'en': 'Welcome, ',
      'es': 'Operador',
      'fr': 'Opérateur',
    },
    '6wipvrx0': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
  },
  // checklistRadioItem
  {
    'uxute7a1': {
      'en': '*must pass',
      'es': '*debe pasar',
      'fr': '*doit passer',
    },
    'nlf6qpsb': {
      'en': 'Failed',
      'es': 'Fallido',
      'fr': 'Échoué',
    },
    '95xfbp70': {
      'en': 'Passed',
      'es': 'Aprobado',
      'fr': 'Passé',
    },
  },
  // checklistInputMust
  {
    'qq69dab3': {
      'en': '*must pass',
      'es': '*debe pasar',
      'fr': '*doit passer',
    },
  },
  // checklistInputMustRequired
  {
    'jmgl9jx8': {
      'en': '*',
      'es': '*',
      'fr': '*',
    },
  },
  // bagCheckInput
  {
    '733fpwur': {
      'en': 'Bag Volume',
      'es': 'Volumen de la bolsa',
      'fr': 'Volume du sac',
    },
    '094abk3a': {
      'en': 'cf',
      'es': 'cf',
      'fr': 'cf',
    },
  },
  // updateLangauge
  {
    'rg3u84jp': {
      'en': 'Language Select',
      'es': '',
      'fr': '',
    },
    'gxiz2d4d': {
      'en': 'English',
      'es': '',
      'fr': '',
    },
    'wzgr6l8i': {
      'en': 'French',
      'es': '',
      'fr': '',
    },
    'ccqnkusb': {
      'en': 'Spanish',
      'es': '',
      'fr': '',
    },
  },
  // Question
  {
    '0ajmkwrw': {
      'en': 'Must Pass',
      'es': '',
      'fr': '',
    },
    'tdidijip': {
      'en': 'Failed',
      'es': '',
      'fr': '',
    },
    '9b8thyzx': {
      'en': 'Passed',
      'es': '',
      'fr': '',
    },
  },
  // AdminQuestion
  {
    'dvvwxki2': {
      'en': 'Label here...',
      'es': '',
      'fr': '',
    },
    'owbnd7j2': {
      'en': 'Save',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'ckw7tn33': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pq6iobcu': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '82t0a6sf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ory07zqh': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'p23slpzl': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'mcqqvinb': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '9fd1gjv2': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'oyx04edu': {
      'en': '',
      'es': '',
      'fr': '',
    },
    's7wvserf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'linvok25': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '5hmk7y1n': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '43ad1qm2': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ykfedvkg': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'aenbhsw9': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lhdxqlxo': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '2j2tlzu6': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'sg3im7ww': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'wpspo0we': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'l4ylbdji': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0p39hjhi': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm4ksvghm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '91grxl2g': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vra2l2hz': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'br1sg3wq': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
