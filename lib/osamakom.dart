import 'dart:math' as math;

import 'package:flutter/material.dart';

const _navy = Color(0xFF202482);
const _background = Color(0xFFF5F6FA);
const _ink = Color(0xFF141B30);
const _cyan = Color(0xFF00D7E9);
const _description =
    'OSAMAKOM (Olimpiade Sains, Matematika, dan Komputer) merupakan '
    'ajang kompetisi tahunan bergengsi yang diselenggarakan oleh '
    'FMIPA Universitas Lampung.';
const _benefits = [
  'Diikuti oleh ratusan peserta dari seluruh Lampung',
  'Sistem penilaian transparan dan terstandarisasi',
  'Hadiah jutaan rupiah & sertifikat penghargaan',
];
const _navigation = [
  'Beranda',
  'Tentang',
  'Kompetisi',
  'Pelatihan STEM',
  'Jadwal',
  'Hadiah',
];

/// Halaman tentang OSAMAKOM dengan navbar tetap dan layout adaptif.
class OsamakomPage extends StatelessWidget {
  const OsamakomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final desktop = constraints.maxWidth >= 1000;
            final side = desktop ? 32.0 : 18.0;
            return Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    key: const ValueKey('osamakom-scroll'),
                    padding: EdgeInsets.only(
                      top: desktop ? 127 : 106,
                      bottom: desktop ? 100 : 92,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: desktop
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth < 1264
                                      ? 32
                                      : 0,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      flex: 38,
                                      child: Center(
                                        child: _LogoPlaceholder(size: 300),
                                      ),
                                    ),
                                    const SizedBox(width: 26),
                                    Expanded(
                                      flex: 62,
                                      child: _AboutContent(desktop: true),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  _LogoPlaceholder(
                                    size: math.min(
                                      constraints.maxWidth * .8,
                                      420,
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 580,
                                      ),
                                      child: _AboutContent(desktop: false),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: desktop ? 16 : 18,
                  left: side,
                  right: side,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: _NavigationBar(desktop: desktop),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({required this.desktop});

  final bool desktop;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('osamakom-navbar'),
      constraints: BoxConstraints(minHeight: desktop ? 70 : 72),
      padding: EdgeInsets.symmetric(
        horizontal: desktop ? 24 : 22,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFB).withValues(alpha: .98),
        borderRadius: BorderRadius.circular(60),
        border: Border.all(color: const Color(0xFFE0E2ED)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x180F1730),
            blurRadius: 28,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          if (desktop) ...[
            const Icon(Icons.school_outlined, color: _navy, size: 27),
            const SizedBox(width: 12),
            const Text(
              'OSAMAKOM 2026',
              style: TextStyle(
                color: _navy,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width < 1200 ? 12 : 36),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (final item in _navigation)
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: _ink,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        minimumSize: const Size(0, 40),
                        textStyle: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 12,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(item),
                    ),
                ],
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width < 1200 ? 12 : 32),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.find_in_page_outlined, size: 15),
              label: const Text('Cek Status'),
              style: TextButton.styleFrom(
                foregroundColor: _navy,
                textStyle: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: _navy,
                foregroundColor: Colors.white,
                minimumSize: const Size(80, 34),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                textStyle: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('Daftar'),
            ),
          ] else ...[
            const _LogoPlaceholder(size: 40, small: true),
            const Spacer(),
            IconButton(
              tooltip: 'Cari informasi',
              onPressed: () {},
              icon: const Icon(Icons.search, color: _ink, size: 26),
            ),
            const SizedBox(width: 2),
            IconButton(
              tooltip: 'Buka menu',
              icon: const Icon(Icons.menu, color: _navy, size: 28),
              onPressed: () {},
            ),
          ],
        ],
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent({required this.desktop});

  final bool desktop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: desktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: desktop ? 17 : 18,
            vertical: desktop ? 8 : 9,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF6E9E0),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Text(
            'TENTANG OSAMAKOM',
            style: TextStyle(
              color: const Color(0xFFFF710C),
              fontSize: desktop ? 12 : 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(height: desktop ? 24 : 26),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Text(
            'Membangun Generasi Saintis Muda yang Kompetitif',
            textAlign: desktop ? TextAlign.left : TextAlign.center,
            style: TextStyle(
              color: _navy,
              fontSize: desktop ? 40 : 31.5,
              height: desktop ? 1.2 : 1.15,
              fontWeight: FontWeight.w700,
              letterSpacing: desktop ? 0 : -.5,
            ),
          ),
        ),
        SizedBox(height: desktop ? 25 : 24),
        Text(
          _description,
          textAlign: desktop ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: desktop ? 16 : 17.5,
            height: desktop ? 1.9 : 1.75,
            color: desktop ? const Color(0xFF6B7E9B) : const Color(0xFF8A9099),
          ),
        ),
        SizedBox(height: desktop ? 29 : 34),
        for (var i = 0; i < _benefits.length; i++) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.task_alt, color: _cyan, size: desktop ? 20 : 23),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  _benefits[i],
                  style: TextStyle(
                    color: _ink,
                    fontSize: desktop ? 14 : 16,
                    height: desktop ? 1.6 : 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          if (i < _benefits.length - 1) SizedBox(height: desktop ? 10 : 14),
        ],
        SizedBox(height: desktop ? 40 : 46),
        Wrap(
          direction: desktop ? Axis.horizontal : Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            _DocumentButton(
              label: 'TATA TERTIB PESERTA',
              icon: Icons.balance_outlined,
              filled: false,
              desktop: desktop,
            ),
            _DocumentButton(
              label: 'RUNDOWN ACARA 2026',
              icon: Icons.calendar_month_outlined,
              filled: true,
              desktop: desktop,
            ),
          ],
        ),
      ],
    );
  }
}

class _DocumentButton extends StatelessWidget {
  const _DocumentButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.desktop,
  });

  final String label;
  final IconData icon;
  final bool filled;
  final bool desktop;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: math.max(0, MediaQuery.sizeOf(context).width - 48),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: desktop ? 18 : 20),
        label: Text(label, textAlign: TextAlign.center),
        style: TextButton.styleFrom(
          backgroundColor: filled ? _navy : Colors.white,
          foregroundColor: filled ? Colors.white : _navy,
          minimumSize: Size(0, desktop ? 37 : 55),
          padding: EdgeInsets.symmetric(
            horizontal: desktop ? 18 : 20,
            vertical: 10,
          ),
          side: const BorderSide(color: _navy, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(desktop ? 12 : 13),
          ),
          elevation: 1,
          shadowColor: const Color(0x30202482),
          textStyle: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: desktop ? 14 : 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// Placeholder lokal: dapat diganti Image.asset ketika logo sudah tersedia.
class _LogoPlaceholder extends StatefulWidget {
  const _LogoPlaceholder({required this.size, this.small = false});

  final double size;
  final bool small;

  @override
  State<_LogoPlaceholder> createState() => _LogoPlaceholderState();
}

class _LogoPlaceholderState extends State<_LogoPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotation;

  @override
  void initState() {
    super.initState();
    // Mulai ticker sekali; hanya cincin yang diputar, bukan isi logo.
    _rotation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _rotation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final small = widget.small;
    return Semantics(
      image: true,
      label: 'Placeholder logo OSAMAKOM FMIPA Unila',
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: small
              ? null
              : const [
                  BoxShadow(
                    color: Color(0x29252D73),
                    blurRadius: 38,
                    offset: Offset(0, 18),
                  ),
                ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            RepaintBoundary(
              child: RotationTransition(
                turns: _rotation,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [
                        Color(0xFF00CFE5),
                        Color(0xFF77B297),
                        Color(0xFFFF790A),
                        Color(0xFF282377),
                        Color(0xFF00CFE5),
                      ],
                      transform: GradientRotation(-math.pi / 6),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size * .027),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: small
                    ? Icon(
                        Icons.school_outlined,
                        size: size * .58,
                        color: _navy,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'OSAMAKOM',
                            style: TextStyle(
                              color: _navy,
                              fontSize: size * .09,
                              fontWeight: FontWeight.w700,
                              letterSpacing: size * .008,
                            ),
                          ),
                          SizedBox(height: size * .045),
                          Icon(
                            Icons.science_outlined,
                            size: size * .30,
                            color: _navy,
                          ),
                          SizedBox(height: size * .045),
                          Text(
                            'FMIPA UNILA',
                            style: TextStyle(
                              color: _navy,
                              fontSize: size * .055,
                              fontWeight: FontWeight.w600,
                              letterSpacing: size * .006,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
