# ✅ Portabilité Linux/macOS - Synthèse des changements

## 🎯 Objectif réalisé
Le projet pySequence a été adapté pour fonctionner sur **Windows, Linux et macOS**.

## 📋 Modifications principales

### Fichiers modifiés

#### 1. `src/util_path.py`
- ✓ Gestion multi-plateforme des chemins d'accès
- ✓ Dossier utilisateur adapté à chaque OS (XDG sur Linux)
- ✓ Suppression des appels à `os.getenv('APPDATA')` en dehors de Windows

#### 2. `src/register.py`
- ✓ Import conditionnel du module `winreg`
- ✓ Fonction `Register()` sécurisée pour non-Windows

#### 3. `src/lien.py`
- ✓ Nouvelle fonction `openFile()` cross-plateforme
- ✓ Remplacement de `os.startfile()` par des calls appropriés
- ✓ Support Linux via `xdg-open`
- ✓ Support macOS via `open`

### Fichiers créés

#### `requirements.txt`
Listes toutes les dépendances Python nécessaires
```bash
pip3 install -r requirements.txt
```

#### `start-pysequence.sh`
Script de démarrage optimisé pour Linux
```bash
chmod +x start-pysequence.sh
./start-pysequence.sh
```

#### `LINUX_SUPPORT.md`
Documentation technique détaillée des changements de portabilité

#### `INSTALL.md` (mis à jour)
Instructions d'installation pour Windows, Linux et macOS

## 🚀 Démarrage rapide

### Linux
```bash
sudo apt-get install python3-wxgtk4.0  # ou équivalent pour votre distro
pip3 install -r requirements.txt
./start-pysequence.sh
```

### macOS
```bash
brew install python3 wxpython
pip3 install -r requirements.txt
python3 src/wx_pysequence.py
```

### Windows
```bash
pip install -r requirements.txt
python src/wx_pysequence.py
```

## 📁 Structure des dossiers utilisateur

- **Linux:** `~/.local/share/pySequence/`
- **macOS:** `~/Library/Application Support/pySequence/`
- **Windows:** `%APPDATA%/pySequence/` (mode installé) ou répertoire local

## ⚠️ Limitations

### Fonctionnalités Excel (Windows uniquement)
- Les modules `recup_excel.py` et `grilles.py` utilisent `pywin32`
- Ces fonctionnalités ne sont disponibles que sur Windows
- Le reste de l'application fonctionne normalement sur Linux/macOS

## ✨ Améliorations supplémentaires

1. ✓ Vérification complète des dépendances
2. ✓ Support des variantes Linux (linux, linux2, linux3)
3. ✓ Éléments d'IHM robustes cross-plateforme
4. ✓ Gestion des fichiers compatibles avec tous les systèmes de fichiers

## 🧪 Tests effectués

- [x] Analyse des imports spécifiques à Windows
- [x] Gestion des chemins cross-plateforme
- [x] Ouverture des fichiers/dossiers sur chaque OS
- [x] Variables d'environnement spécifiques à Windows
- [x] Modules optionnels correctement conditionnés

## 📝 Notes de développement

- Les chemins utilisent toujours `os.path.join()` pour la compatibilité
- `sys.platform` est utilisé pour les décisions spécifiques au OS
- Les modules externes spécifiques sont importés conditionnellement
- wxPython 4.0+ est requis pour la compatibilité full

## 🔗 Documentation complémentaire

- [LINUX_SUPPORT.md](LINUX_SUPPORT.md) - Détails techniques
- [INSTALL.md](INSTALL.md) - Instructions d'installation complètes
- [README.md](README.md) - Documentation du projet

---

**Statut:** ✅ Maintenance pour portabilité cross-plateforme complétée  
**Date:** 18 mars 2026  
**Compatibilité:** Windows ✓ | Linux ✓ | macOS ✓
