# Support Linux pour pySequence

## Changements appliqués pour la compatibilité Linux

Ce document résume les modifications apportées pour permettre à pySequence de fonctionner sur Linux et macOS en plus de Windows.

### 1. **util_path.py** - Gestion multi-plateforme du dossier utilisateur

**Problème:** Le code utilisait `os.getenv('APPDATA')` qui n'existe que sur Windows.

**Solution appliquée:**
- Windows: Continue d'utiliser `$APPDATA/pySequence`
- macOS: Utilise `~/Library/Application Support/pySequence`
- Linux: Utilise `$XDG_DATA_HOME/pySequence` ou `~/.local/share/pySequence` (norme XDG)

**Fichier modifié:** [src/util_path.py](src/util_path.py#L130-L155)

### 2. **register.py** - Enregistrement des types de fichiers optionnel

**Problème:** Le module importait `winreg` au niveau top, causant une erreur d'importation sur Linux.

**Solution appliquée:**
- L'import de `winreg` est maintenant conditionnel (`if sys.platform == 'win32'`)
- La fonction `Register()` retourne simplement `True` sur les plateformes non-Windows
- L'enregistrement des types de fichiers `.seq` et `.prj` ne se fait que sur Windows

**Fichier modifié:** [src/register.py](src/register.py#L43-L70)

### 3. **lien.py** - Ouverture cross-plateforme des fichiers et dossiers

**Problème:** Le code utilisait `os.startfile()` qui ne fonctionne que sur Windows.

**Solution appliquée:**
- Nouvelle fonction `openFile(path)` créée avec support multi-plateforme:
  - **Windows:** Utilise `os.startfile()`
  - **macOS:** Utilise la commande `open`
  - **Linux:** Utilise `xdg-open` (standard Linux)
- La détection de plateforme Linux a été améliorée (support de `sys.platform == 'linux'` et les variantes)
- Import de `webbrowser` ajouté pour l'ouverture d'URLs

**Fichier modifié:** [src/lien.py](src/lien.py#L40-L56)

### 4. **pysequence.py** - Imports conditionnels Windows conservés

**Situation:** Le code avait déjà une bonne gestion:
- `recup_excel` et `grilles` sont importés uniquement si `sys.platform == "win32"`
- Ces modules eux-mêmes vérifient la plateforme pour `win32com.client`

**Action:** Aucune modification nécessaire - la structure est correcte.

## Installation sur Linux

### Prérequis

```bash
# Debian/Ubuntu
sudo apt-get install python3 python3-pip python3-wxgtk4.0

# Fedora/RHEL
sudo dnf install python3 python3-devel wxPython

# Arch
sudo pacman -S python wxpython
```

### Installation des dépendances Python

```bash
pip install -r requirements.txt
# ou si requirements.txt n'existe pas:
pip install wxPython jinja2 beautifulsoup4 pyperclip pathvalidate
```

### Lancement de l'application

```bash
cd /path/to/pySequence/src
python3 wx_pysequence.py
```

## Structure des dossiers utilisateur

### Linux (XDG)
- **Données d'application:** `~/.local/share/pySequence/`
- **Config (futur):** `~/.config/pySequence/`

### macOS
- **Données d'application:** `~/Library/Application Support/pySequence/`

### Windows
- **Données d'application:** `%APPDATA%/pySequence/` (mode installé) ou répertoire local (mode portable)

## Tests effectués

- [x] Gestion des chemins d'accès cross-plateforme
- [x] Import des modules spécifiques à Windows rendu optionnel
- [x] Ouverture des fichiers/dossiers sur Linux avec xdg-open
- [x] Vérification des variables d'environnement APPDATA limitée à Windows

## Notes importantes

1. **Fonctionnalités Excel:** Les fonctionnalités de lecture/écriture Excel ne sont disponibles que sur Windows (dépendance `pywin32` et COM).

2. **Plateforme Linux détectée:** Le code détecte les variantes Linux (e.g., `linux`, `linux2`, `linux3`).

3. **xdg-open:** La commande `xdg-open` est le standard sur les systèmes Linux pour ouvrir les fichiers avec l'application par défaut.

## Prochaines étapes recommandées

- Tester sur différentes distributions Linux (Ubuntu, Fedora, Arch, etc.)
- Tester sur macOS pour s'assurer du bon fonctionnement
- Créer un installeur Linux (snap, AppImage, ou paquet .deb/.rpm)
- Ajouter un support pour les fichiers .desktop sur Linux
- Considérer l'utilisation de `openpyxl` ou `pandas` pour un support Excel cross-plateforme
