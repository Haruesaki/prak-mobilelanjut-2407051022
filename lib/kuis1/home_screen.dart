import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double kDesignW = 1220.0;
const double kDesignH = 2712.0;
const double kAspectRatio = kDesignW / kDesignH;

class Kuis1HomeScreen extends StatefulWidget {
  const Kuis1HomeScreen({super.key});

  @override
  State<Kuis1HomeScreen> createState() => _Kuis1HomeScreenState();
}

class _Kuis1HomeScreenState extends State<Kuis1HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          key: const Key('phone_frame'),
          aspectRatio: kAspectRatio,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double w = constraints.maxWidth;
              final double h = constraints.maxHeight;

              // Helper: font size from width fraction (single multiplication)
              double fs(double fraction) => w * fraction;

              return Stack(
                fit: StackFit.expand,
                children: [
                  // Layer 1: Wallpaper (full-bleed)
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/kuis1/wallpaper.jpeg',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),

                  // Layer 2: Status Bar
                  _buildStatusBar(w, h, fs),

                  // Layer 3: App Icon Row (4 icons + labels)
                  _buildAppIconRow(w, h, fs),

                  // Layer 4: Search Pill
                  _buildSearchPill(w, h, fs),

                  // Layer 5: Dock (4 circular icons)
                  _buildDock(w, h, fs),

                  // Layer 6: Gesture Bar
                  _buildGestureBar(w, h, fs),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // ==================== STATUS BAR ====================
  Widget _buildStatusBar(double w, double h, double Function(double) fs) {
    return Positioned(
      top: w * 0,
      left: 0,
      right: 0,
      height: w * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LEFT SIDE
          Row(
            children: [
              SizedBox(width: w * 0.069),
              // Time 3:34
              Text(
                '3:34',
                key: const Key('status_clock'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fs(0.046),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              SizedBox(width: w * 0.025),
              // Chat bubble
              Icon(Icons.chat_bubble, color: Colors.white, size: fs(0.034)),
              SizedBox(width: w * 0.015),
              // Gift card
              Icon(Icons.card_giftcard, color: Colors.white, size: fs(0.036)),
              SizedBox(width: w * 0.015),
              // Mail
              Icon(Icons.mail_outline, color: Colors.white, size: fs(0.034)),
              SizedBox(width: w * 0.015),
              // Three dots
              Text(
                '···',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fs(0.034),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
            ],
          ),

          // RIGHT SIDE
          Row(
            children: [
              // Network speed: 0.03 KB/s (2 lines, right-aligned)
              SizedBox(
                width: w * 0.043,
                child: Text(
                  '0.03\nKB/s',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fs(0.027),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlusJakartaSans',
                    height: 1.0,
                  ),
                ),
              ),
              SizedBox(width: w * 0.009),
              // Signal 1
              Icon(Icons.signal_cellular_alt, color: Colors.white, size: fs(0.040)),
              SizedBox(width: w * 0.005),
              // Signal 2
              Icon(Icons.signal_cellular_alt, color: Colors.white, size: fs(0.040)),
              SizedBox(width: w * 0.013),
              // WiFi
              Icon(Icons.wifi, color: Colors.white, size: fs(0.043)),
              SizedBox(width: w * 0.008),
              // Battery pill
              Container(
                width: w * 0.061,
                height: w * 0.031,
                decoration: BoxDecoration(
                  color: const Color(0xD9FFFFFF),
                  borderRadius: BorderRadius.circular(w * 0.008),
                ),
                child: Center(
                  child: Text(
                    '97',
                    key: const Key('status_battery_text'),
                    style: TextStyle(
                      color: const Color(0xFF2B2B2B),
                      fontSize: fs(0.032),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlusJakartaSans',
                    ),
                  ),
                ),
              ),
              SizedBox(width: w * 0.068),
            ],
          ),
        ],
      ),
    );
  }

  // ==================== APP ICON ROW ====================
  Widget _buildAppIconRow(double w, double h, double Function(double) fs) {
    const List<double> colCenters = [0.148, 0.382, 0.616, 0.851];
    const double iconDiameter = 0.148;
    const double iconCenterY = 0.318;
    const double labelCenterY = 0.367;

    final double d = w * iconDiameter;

    final List<Map<String, dynamic>> apps = [
      {
        'key': 'icon_wondr',
        'labelKey': 'label_wondr',
        'asset': 'assets/icons/wondr.png',
        'badge': null,
      },
      {
        'key': 'icon_dana',
        'labelKey': 'label_dana',
        'asset': 'assets/icons/dana.png',
        'badge': '1',
        'badgeKey': 'badge_dana',
      },
      {
        'key': 'icon_shopee',
        'labelKey': 'label_shopee',
        'asset': 'assets/icons/shopee.png',
        'badge': null,
      },
      {
        'key': 'icon_myim3',
        'labelKey': 'label_myim3',
        'asset': 'assets/icons/myim3.png',
        'badge': null, // red dot already in PNG
      },
    ];

    final labels = [
      'wondr by BNI',
      'DANA',
      'Shopee',
      'myIM3',
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 4 Icons with badges
        for (int i = 0; i < 4; i++)
          Positioned(
            left: w * colCenters[i] - d / 2,
            top: h * iconCenterY - d / 2,
            width: d,
            height: d,
            child: _buildAppIcon(
              key: Key(apps[i]['key'] as String),
              diameter: d,
              asset: apps[i]['asset'] as String,
              badge: apps[i]['badge'] as String?,
              badgeKey: apps[i]['badgeKey'] as String?,
              w: w,
              fs: fs,
            ),
          ),
        // 4 Labels
        for (int i = 0; i < 4; i++)
          Positioned(
            left: w * colCenters[i] - d * 1.15 / 2,
            top: h * labelCenterY - fs(0.031) / 2,
            width: d * 1.15,
            child: Text(
              labels[i],
              key: Key(apps[i]['labelKey'] as String),
              textAlign: TextAlign.center,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.white,
                fontSize: fs(0.031),
                fontWeight: FontWeight.w400,
                fontFamily: 'PlusJakartaSans',
                shadows: [
                  Shadow(
                    color: const Color(0x66000000),
                    blurRadius: w * 0.004,
                    offset: Offset(0, w * 0.001),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAppIcon({
    required Key key,
    required double diameter,
    required String asset,
    required String? badge,
    required String? badgeKey,
    required double w,
    required double Function(double) fs,
  }) {
    return Container(
      key: key,
      width: diameter,
      height: diameter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Circular PNG icon
          ClipOval(
            child: Image.asset(
              asset,
              width: diameter,
              height: diameter,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          // Badge (only for DANA "1" and Messages "4")
          if (badge != null)
            Positioned(
              left: diameter * 0.78,
              top: -diameter * 0.13,
              child: Container(
                key: Key(badgeKey!),
                width: diameter * 0.355,
                height: diameter * 0.355,
                decoration: const BoxDecoration(
                  color: Color(0xFFE53935),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  badge,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fs(0.034),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'PlusJakartaSans',
                    height: 1.0,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ==================== SEARCH PILL ====================
  Widget _buildSearchPill(double w, double h, double Function(double) fs) {
    const double pillWidthFraction = 0.19;
    const double pillHeightFraction = 0.033;
    const double centerX = 0.50;
    const double centerY = 0.832;

    final double pillW = w * pillWidthFraction;
    final double pillH = h * pillHeightFraction;

    return Positioned(
      left: w * centerX - pillW / 2,
      top: h * centerY - pillH / 2,
      width: pillW,
      height: pillH,
      child: Container(
        key: const Key('search_pill'),
        decoration: BoxDecoration(
          color: const Color(0xB3281A14),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: fs(0.034),
            ),
            SizedBox(width: w * 0.012),
            Text(
              'Search',
              key: const Key('search_text'),
              style: TextStyle(
                color: Colors.white,
                fontSize: fs(0.031),
                fontWeight: FontWeight.w400,
                fontFamily: 'PlusJakartaSans',
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== DOCK ====================
  Widget _buildDock(double w, double h, double Function(double) fs) {
    const List<double> colCenters = [0.148, 0.382, 0.616, 0.851];
    const double iconDiameter = 0.148;
    const double centerY = 0.909;

    final double d = w * iconDiameter;

    final List<Map<String, dynamic>> dockApps = [
      {
        'key': 'dock_phone',
        'asset': 'assets/icons/phone.png',
        'badge': null,
      },
      {
        'key': 'dock_messages',
        'asset': 'assets/icons/messages.png',
        'badge': '4',
        'badgeKey': 'badge_messages',
      },
      {
        'key': 'dock_whatsapp',
        'asset': 'assets/icons/whatsapp.png',
        'badge': null,
      },
      {
        'key': 'dock_browser',
        'asset': 'assets/icons/browser.png',
        'badge': null,
      },
    ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (int i = 0; i < 4; i++)
          Positioned(
            left: w * colCenters[i] - d / 2,
            top: h * centerY - d / 2,
            width: d,
            height: d,
            child: _buildDockIcon(
              key: Key(dockApps[i]['key'] as String),
              diameter: d,
              asset: dockApps[i]['asset'] as String,
              badge: dockApps[i]['badge'] as String?,
              badgeKey: dockApps[i]['badgeKey'] as String?,
              w: w,
              fs: fs,
            ),
          ),
      ],
    );
  }

  Widget _buildDockIcon({
    required Key key,
    required double diameter,
    required String asset,
    required String? badge,
    required String? badgeKey,
    required double w,
    required double Function(double) fs,
  }) {
    return Container(
      key: key,
      width: diameter,
      height: diameter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Circular PNG icon
          ClipOval(
            child: Image.asset(
              asset,
              width: diameter,
              height: diameter,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          // Badge for Messages "4"
          if (badge != null)
            Positioned(
              left: diameter * 0.78,
              top: -diameter * 0.13,
              child: Container(
                key: Key(badgeKey!),
                width: diameter * 0.355,
                height: diameter * 0.355,
                decoration: const BoxDecoration(
                  color: Color(0xFFE53935),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  badge,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fs(0.034),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'PlusJakartaSans',
                    height: 1.0,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ==================== GESTURE BAR ====================
  Widget _buildGestureBar(double w, double h, double Function(double) fs) {
    const double barWidthFraction = 0.35;
    const double barHeightFraction = 0.004;
    const double centerX = 0.50;
    const double centerY = 0.990;

    final double barW = w * barWidthFraction;
    final double barH = h * barHeightFraction;

    return Positioned(
      left: w * centerX - barW / 2,
      top: h * centerY - barH / 2,
      width: barW,
      height: barH,
      child: Container(
        key: const Key('gesture_bar'),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(barH / 2),
        ),
      ),
    );
  }
}