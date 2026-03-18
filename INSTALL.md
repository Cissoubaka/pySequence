# ![](Logo_60.png)  Installation de pySéquence

## Versions publiées (Windows)
_testé sur XP, 7 et 10, 32 et 64 bits_

Il suffit de télécharger un pack parmi les [versions disponibles](https://github.com/cedrick-f/pySequence/releases).
* pySequence_x.x.x.exe pour la version **installable**
* pySequence_x.x.x.zip pour la version **portable**

---

## Installation à partir des sources

### Windows, Linux, macOS

Les sources de toutes les [versions disponibles](https://github.com/cedrick-f/pySequence/releases) sont fournies au format .zip ou .tar.gz

### Installation Linux

#### Prérequis
```bash
# Debian/Ubuntu
sudo apt-get install python3 python3-pip python3-wxgtk4.0

# Fedora/RHEL
sudo dnf install python3 python3-devel wxPython

# Arch Linux
sudo pacman -S python wxpython

# Alpine
apk add python3 py3-pip py3-wxpython
```

#### Installation des dépendances Python
```bash
cd /chemin/vers/pySequence
pip3 install -r requirements.txt
```

#### Lancement
```bash
# Option 1: Utiliser le script de lancement
chmod +x start-pysequence.sh
./start-pysequence.sh

# Option 2: Lancement direct
cd src
python3 wx_pysequence.py
```

### macOS

#### Prérequis
```bash
# Utiliser Homebrew
brew install python3 wxpython

# Ou via MacPorts
sudo port install python3 py3*-wxPython-4.0
```

#### Installation
```bash
cd /chemin/vers/pySequence
pip3 install -r requirements.txt
python3 src/wx_pysequence.py
```

---

## Organisation des dossiers utilisateur

### Linux (XDG)
- **Données d'application:** `~/.local/share/pySequence/`
- **Configuration (futur):** `~/.config/pySequence/`

### macOS
- **Données d'application:** `~/Library/Application Support/pySequence/`

### Windows
- **Mode installé:** `%APPDATA%/pySequence/`
- **Mode portable:** Répertoire local

---

## Dépannage

### wxPython ne s'installe pas via pip
Sur certains systèmes, il est préférable d'installer wxPython via le gestionnaire de paquets:
```bash
# Debian/Ubuntu
sudo apt-get install python3-wxgtk4.0

# Fedora
sudo dnf install python3-wxPython
```

### Erreurs lors du démarrage sous Linux
1. Vérifiez que toutes les dépendances sont installées: `pip3 install -r requirements.txt`
2. Vérifiez que wxPython est correctement installé: `python3 -c "import wx; print(wx.__version__)"`
3. Consultez le fichier [LINUX_SUPPORT.md](LINUX_SUPPORT.md) pour plus d'informations

---

Voir aussi: [LINUX_SUPPORT.md](LINUX_SUPPORT.md) pour les détails techniques de la portabilité
