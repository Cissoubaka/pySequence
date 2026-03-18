#!/bin/bash
# Script de lancement de pySequence sur Linux
# 
# Usage: ./start-pysequence.sh
# ou:    python3 src/wx_pysequence.py

set -e

# Déterminer le répertoire du script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Afficher les informations
echo "═══════════════════════════════════════"
echo "  pySequence - Démarrage sous Linux"
echo "═══════════════════════════════════════"
echo ""

# Vérifier Python 3
if ! command -v python3 &> /dev/null; then
    echo "❌ Erreur: Python 3 n'est pas installé"
    echo "   Veuillez installer Python 3 puis réessayer"
    exit 1
fi

PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
echo "✓ Python 3 trouvé: $PYTHON_VERSION"

# Vérifier wxPython
echo ""
echo "Vérification des dépendances..."
if ! python3 -c "import wx" 2>/dev/null; then
    echo "❌ wxPython n'est pas installé"
    echo ""
    echo "Installation des dépendances:"
    echo "  Debian/Ubuntu:"
    echo "    sudo apt-get install python3-wxgtk4.0"
    echo "  Fedora/RHEL:"
    echo "    sudo dnf install python3-wxPython"
    echo "  Arch:"
    echo "    sudo pacman -S wxpython"
    echo ""
    echo "Ou installez via pip:"
    echo "    pip3 install -r requirements.txt"
    exit 1
fi
echo "✓ wxPython trouvé"

# Vérifier les autres dépendances
MISSING=""
for package in jinja2 bs4 pyperclip pathvalidate; do
    if ! python3 -c "import $package" 2>/dev/null; then
        MISSING="$MISSING $package"
    fi
done

if [ -n "$MISSING" ]; then
    echo "⚠ Dépendances manquantes:$MISSING"
    echo "  Installez avec: pip3 install -r requirements.txt"
    echo ""
fi

# Changer vers le répertoire src
cd "$SCRIPT_DIR/src"

# Lancer l'application
echo ""
echo "Démarrage de pySequence..."
echo "════════════════════════════════════════"
echo ""

python3 wx_pysequence.py "$@"
