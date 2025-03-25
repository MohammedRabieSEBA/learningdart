
# Learning Dart

**Learning Dart** est un mini-projet développé dans le but d'apprendre les bases du langage Dart et de la programmation mobile avec Flutter. Ce projet permet de se familiariser avec les concepts fondamentaux de Flutter tout en créant une application multiplateforme. L'objectif est de comprendre la gestion des vues, l'authentification via Firebase, la navigation, ainsi que l'intégration de services backend. Ce mini-projet a été conçu comme une première approche pour maîtriser les bases du développement Flutter et Dart, en couvrant les principaux concepts nécessaires pour construire une application mobile et multiplateforme.

## Fonctionnalités

- Authentification via Firebase (inscription, connexion, vérification d'email)
- Navigation entre les différentes vues (login, inscription, notes)
- Gestion des erreurs avec des dialogues d'erreur
- Utilisation de Firebase pour gérer les utilisateurs et les données
- Structure de projet bien organisée pour un développement Flutter multiplateforme (iOS, Android, Web, Windows, macOS, Linux)

## Prérequis

Avant de commencer, vous devez avoir les éléments suivants installés :

- [Flutter](https://flutter.dev/docs/get-started/install) - SDK Flutter pour le développement mobile et multiplateforme
- [Dart](https://dart.dev/get-dart) - Le langage utilisé par Flutter
- [Firebase](https://firebase.google.com/) - Plateforme pour l'authentification et le stockage des données
- [Xcode](https://developer.apple.com/xcode/) - Si vous développez pour iOS ou macOS
- [Android Studio](https://developer.android.com/studio) - Pour les environnements Android et Windows

## Installation

1. Clonez ce repository sur votre machine locale :

   ```bash
   git clone https://github.com/votre-utilisateur/learningdart-master.git
   ```

2. Accédez au répertoire du projet :

   ```bash
   cd learningdart-master
   ```

3. Installez les dépendances avec `flutter` :

   ```bash
   flutter pub get
   ```

4. Configurez Firebase pour votre projet en suivant les étapes sur la [documentation officielle de Firebase](https://firebase.flutter.dev/docs/overview).

5. Exécutez l'application sur votre plateforme de développement préférée :

   - Sur Android : 
     ```bash
     flutter run -d android
     ```

   - Sur iOS : 
     ```bash
     flutter run -d ios
     ```

   - Sur Web : 
     ```bash
     flutter run -d chrome
     ```

## Structure du projet

Voici une vue d'ensemble de la structure des fichiers du projet :

```
learningdart-master/
├── android/                  # Code spécifique à Android
├── ios/                      # Code spécifique à iOS
├── lib/                      # Code Dart principal
│   ├── services/             # Services pour la gestion des données
│   ├── view/                 # Vues pour chaque écran (login, register, etc.)
│   ├── utilities/            # Utilitaires divers
│   ├── constants/            # Constantes pour les routes et autres
│   └── firebase_options.dart # Configuration Firebase
├── test/                     # Tests unitaires et widget tests
├── web/                      # Code pour la version Web
├── windows/                  # Code pour Windows
├── macos/                    # Code pour macOS
├── linux/                    # Code pour Linux
└── README.md                 # Ce fichier
```

## Fonctionnement des composants

### 1. Authentification

Le système d'authentification est géré via Firebase. Les utilisateurs peuvent s'inscrire, se connecter et recevoir un email de vérification. Le processus est géré dans le fichier `auth_service.dart`.

### 2. Navigation

La navigation entre les différentes vues (connexion, inscription, etc.) se fait via le package Flutter Navigator. Les routes sont définies dans le fichier `routes.dart`.

### 3. Gestion des erreurs

Les erreurs, comme les échecs de connexion ou de vérification, sont gérées par un dialogue d'erreur, implémenté dans `show_error_dialog.dart`.

## Tests

Pour lancer les tests unitaires et widget tests, vous pouvez utiliser la commande suivante :

```bash
flutter test
```

Les tests se trouvent dans le répertoire `test/`.

## Contributions

Les contributions sont les bienvenues ! Si vous souhaitez améliorer ce projet, veuillez suivre ces étapes :

1. Fork ce projet.
2. Créez une branche pour votre fonctionnalité (`git checkout -b feature/ma-fonctionnalité`).
3. Committez vos modifications (`git commit -am 'Ajout de ma fonctionnalité'`).
4. Poussez votre branche (`git push origin feature/ma-fonctionnalité`).
5. Ouvrez une Pull Request.

## Auteurs

- **SEBA Mohammed Rabie** - Développeur principal




