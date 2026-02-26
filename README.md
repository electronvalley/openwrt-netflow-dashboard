# 🌐 OpenWrt NetFlow Dashboard

**Dashboard de monitoring réseau animé en temps réel pour routeurs OpenWrt**

Visualisation style SOC Prime avec flux de données animés, particules, et monitoring complet de votre réseau.

---

## ✨ Fonctionnalités

- **Animation Canvas** — Flux de particules animés entre les interfaces, le routeur, le firewall et les appareils
- **Débits temps réel** — Download/Upload par interface avec historique
- **Appareils connectés** — Liste complète avec connexions actives et trafic par appareil
- **Analyse des flux** — Connexions TCP/UDP, ports, protocoles
- **Types de trafic** — HTTPS, DNS, MQTT, IoT, etc. avec barres de progression
- **Sécurité** — Détection de ports suspects, connexions externes, état du firewall
- **Monitoring système** — CPU, RAM, stockage, uptime
- **Graphique WAN** — Historique du débit sur 60 points
- **WiFi** — Informations des interfaces WiFi
- **Login animé** — Écran de connexion avec particules connectées

## 🚀 Installation

### Installation automatique (recommandée)

Connectez-vous en SSH à votre routeur OpenWrt et exécutez :

```bash
wget -O- https://raw.githubusercontent.com/electronvalley/openwrt-netflow-dashboard/main/install.sh | sh
```

### Installation manuelle

```bash
mkdir -p /www/netflow
wget -O /www/netflow/index.html https://raw.githubusercontent.com/electronvalley/openwrt-netflow-dashboard/main/htdocs/netflow/index.html
chmod 644 /www/netflow/index.html
/etc/init.d/uhttpd restart
```

### Accès

Ouvrez votre navigateur et allez à :

```
http://192.168.10.1/netflow/
```

Connectez-vous avec vos identifiants OpenWrt (root / mot de passe).

## 🛠️ Compatibilité

| Élément | Version |
|---------|---------|
| OpenWrt | 21.x, 22.x, 23.x |
| LuCI | Requis (pour l'API ubus) |
| Navigateur | Chrome, Firefox, Edge, Safari |
| Matériel | Tout routeur OpenWrt (testé sur ASUS RT-AX53U) |

## 📡 APIs utilisées

Le dashboard utilise l'API JSON-RPC ubus de LuCI :

| API | Usage |
|-----|-------|
| `luci-rpc/getNetworkDevices` | Statistiques des interfaces |
| `system/info` | CPU, RAM, uptime |
| `luci-rpc/getDHCPLeases` | Appareils connectés |
| `luci-rpc/getHostHints` | Noms des appareils |
| `luci/getConntrackList` | Flux actifs (conntrack) |
| `luci-rpc/getWirelessDevices` | Informations WiFi |

## 📁 Structure

```
openwrt-netflow-dashboard/
├── htdocs/netflow/
│   └── index.html      # Dashboard complet (HTML + CSS + JS)
├── install.sh              # Script d'installation automatique
├── LICENSE                 # MIT
└── README.md
```

## 🎨 Design

- Thème sombre premium avec accents verts/bleus/violets
- Animation de particules avec traînées lumineuses
- Nœuds avec arcs rotatifs et effets de lueur
- Grille subtile en arrière-plan
- Interface responsive
- Scrollbars personnalisées
- Typographie: Inter / Segoe UI

## 🔧 Désinstallation

```bash
rm -rf /www/netflow
```

## 📄 Licence

MIT © electronvalley
