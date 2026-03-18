# 🎉 pySequence est maintenant compatible Linux!

## Démarrage rapide (Linux)

### 1. Installation des dépendances système
```bash
# Debian/Ubuntu
sudo apt-get install python3 python3-pip python3-wxgtk4.0

# Fedora/RHEL/CentOS
sudo dnf install python3 python3-pip wxPython

# Arch Linux  
sudo pacman -S python wxpython

# Alpine Linux
apk add python3 py3-pip py3-wxpython
```

### 2. Installation des dépendances Python
```bash
cd /path/to/pySequence
pip3 install --break-system-packages -r requirements.txt
```

### 3. Lancer l'application

**Option A - Script de démarrage automatique (recommandé):**
```bash
./start-pysequence.sh
```

**Option B - Lancement direct Python:**
```bash
python3 src/wx_pysequence.py
```

## 📁 Emplacements des fichiers

- **Données utilisateur:** `~/.local/share/pySequence/`
  - C'est où l'application stocke vos fichiers de configuration
  - Créé automatiquement au premier lancement

- **Code source:** `/path/to/pySequence/src/`

## ✨ Fonctionnalités disponibles sur Linux

- ✅ Création et gestion de séquences pédagogiques
- ✅ Validation de projets
- ✅ Gestion des progressions
- ✅ Export PDF, SVG, HTML
- ✅ Gestion des compétences et domaines
- ✅ \* Lecture/écriture de fichiers Excel (voir note ci-dessous)

*Note: Les fonctionnalités Excel complètes (lecture fichiers .xls) ne sont disponibles que sur Windows via pywin32 COM*

## 🐛 Dépannage

### wxPython ne s'installe pas via pip

Sur certains systèmes, wxPython est mieux installé via le gestionnaire de paquets:

```bash
# Debian/Ubuntu
sudo apt-get install python3-wxgtk4.0

# Fedora  
sudo dnf install python3-wxPython

# Arch
sudo pacman -S wxpython
```

### Erreurs lors du démarrage

1. **"Aucun module nommé..."** - Installez les dépendances:
   ```bash
   pip3 install --break-system-packages -r requirements.txt
   ```

2. **Problèmes d'affichage** - Sur certains systèmes sans affichage:
   ```bash
   export DISPLAY=:0
   ./start-pysequence.sh
   ```

3. **Port déjà utilisé** - L'application utilise le port 27115 pour l'instance unique:
   ```bash
   # Vérifier si le port est utilisé:
   lsof -i :27115
   ```

## 📚 Documentation

- [PORTABILITY.md](PORTABILITY.md) - Guide complet de portabilité
- [LINUX_SUPPORT.md](LINUX_SUPPORT.md) - Détails techniques
- [PYTHON312_FIXES.md](PYTHON312_FIXES.md) - Corrections Python 3.12+
- [INSTALL.md](INSTALL.md) - Instructions d'installation complètes

## 🔧 Développement

Pour modifier le code:

```bash
cd /path/to/pySequence/src
python3 wx_pysequence.py
```

Les modifications de fichiers Python sont appliquées au redémarrage.

## 🎓 Cas d'usage

pySequence est particulièrement utile pour:
- Professeurs de Sciences Industrielles de l'Ingénieur (SI)
- Enseignants en technologie et STI2D
- Professeurs de NSI et SNT
- Professeurs de STS

## 💬 Support

Pour les bugs et demandes de fonctionnalités:
- Consultez les [GitHub Issues](https://github.com/cedrick-f/pySequence/issues)
- Vérifiez la [documentation du projet](https://cedrick-f.github.io/pySequence)

---

**Bienvenue sur pySequence pour Linux! 🚀**

Vous pouvez maintenant créer et gérer vos séquences pédagogiques directement sur votre ordinateur Linux.
