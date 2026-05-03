import 'package:cognizone/helpers/myCarousel.dart';
import 'package:flutter/material.dart';
import 'package:cognizone/coursePage.dart';
import 'courseDashboard.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final LayerLink _tutorialLayerLink = LayerLink();
  OverlayEntry? _tutorialOverlayEntry;
  bool _isTutorialMenuOpen = false;
  String _selectedLanguage = "Python";

  void _toggleTutorialMenu() {
    if (_isTutorialMenuOpen) {
      _closeTutorialMenu();
    } else {
      _openTutorialMenu();
    }
  }

  void _openTutorialMenu() {
    _tutorialOverlayEntry = _createTutorialOverlayEntry();
    Overlay.of(context).insert(_tutorialOverlayEntry!);
    setState(() => _isTutorialMenuOpen = true);
  }

  void _closeTutorialMenu() {
    _tutorialOverlayEntry?.remove();
    _tutorialOverlayEntry = null;
    setState(() => _isTutorialMenuOpen = false);
  }

  OverlayEntry _createTutorialOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeTutorialMenu,
              behavior: HitTestBehavior.translucent,
              child: const SizedBox.expand(),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width < 440
                ? MediaQuery.of(context).size.width - 40
                : 400,
            child: CompositedTransformFollower(
              link: _tutorialLayerLink,
              showWhenUnlinked: false,
              offset: Offset(
                  MediaQuery.of(context).size.width < 440 ? 0 : -150, 30),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    alignment: WrapAlignment.start,
                    children: [
                      _sidebarItem("Python"),
                      _sidebarItem("JavaScript"),
                      _sidebarItem("TypeScript"),
                      _sidebarItem("SQL"),
                      _sidebarItem("HTML"),
                      _sidebarItem("CSS"),
                      _sidebarItem("C"),
                      _sidebarItem("C++"),
                      _sidebarItem("Java"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 900;

        return Scaffold(
          endDrawer: const Drawer(
            width: 300,
            child: UserSidebar(),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 10 : 40, vertical: 15),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "MyWebsite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (!isMobile) ...[
                        const SizedBox(width: 40),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CoursePage(
                                    courseName: 'Getting Started With Python',
                                    language: 'Python',
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "Course",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                        CompositedTransformTarget(
                          link: _tutorialLayerLink,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: _toggleTutorialMenu,
                              child: Row(
                                children: [
                                  const Text(
                                    "Tutorial",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    _isTutorialMenuOpen
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Row(
                    children: [
                      if (!isMobile)
                        Builder(
                          builder: (context) => MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => Scaffold.of(context).openEndDrawer(),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.white24,
                                    child: Icon(Icons.person,
                                        color: Colors.white, size: 20),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    "SANKET SAHA",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.keyboard_arrow_down,
                                      color: Colors.white, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (isMobile)
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () =>
                                Scaffold.of(context).openEndDrawer(),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            color: const Color(0xFFF8F9FB),
            child: SingleChildScrollView(
              //padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              child: Column(
                children: [
                  myCarousel(),
                  const SizedBox(height: 50),
                  const Text(
                    "Learn programming for free",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                  const SizedBox(height: 50),
                  // ── LANGUAGE GRID ─────────────────────────────────────
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildLanguageCard("Python", Icons.code, Colors.blue),
                      _buildLanguageCard("SQL", Icons.storage, Colors.orange),
                      _buildLanguageCard(
                          "R", Icons.analytics, Colors.blueAccent),
                      _buildLanguageCard("HTML", Icons.html, Colors.deepOrange),
                      _buildLanguageCard("CSS", Icons.css, Colors.blue),
                      _buildLanguageCard("JavaScript", Icons.javascript,
                          Colors.yellow.shade700),
                      _buildLanguageCard("TypeScript", Icons.code, Colors.blue),
                      _buildLanguageCard("Java", Icons.coffee, Colors.red),
                      _buildLanguageCard("C", Icons.copyright, Colors.blueGrey),
                      _buildLanguageCard("C++", Icons.add_box, Colors.blue),
                      _buildLanguageCard("C#", Icons.tag, Colors.purple),
                      _buildLanguageCard("Go", Icons.bolt, Colors.cyan),
                      _buildLanguageCard(
                          "Kotlin", Icons.smartphone, Colors.indigo),
                      _buildLanguageCard(
                          "Swift", Icons.apple, Colors.orangeAccent),
                      _buildLanguageCard(
                          "DSA", Icons.account_tree, Colors.green),
                      _buildLanguageCard(
                          "NumPy", Icons.calculate, Colors.blue.shade800),
                      _buildLanguageCard(
                          "Pandas", Icons.table_chart, Colors.indigo.shade900),
                      _buildLanguageCard("Rust", Icons.settings, Colors.brown),
                      _buildLanguageCard("Ruby", Icons.atm, Colors.redAccent),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _sidebarItem(String label, {bool isGrey = false}) {
    bool isActive = _selectedLanguage == label;
    return InkWell(
      onTap: () {
        if (!isGrey) {
          setState(() => _selectedLanguage = label);
          _closeTutorialMenu();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoursePage(
                courseName: 'Getting Started With $label',
                language: label,
              ),
            ),
          );
        }
      },
      child: Card(
        elevation: isActive ? 4 : 1,
        color: isActive ? Colors.blue.shade50 : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isActive ? Colors.blue : Colors.grey.shade300,
            width: isActive ? 2 : 1,
          ),
        ),
        child: Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? Colors.blue.shade700 : Colors.grey.shade800,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageCard(String label, IconData icon, Color iconColor) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D3436),
            ),
          ),
        ],
      ),
    );
  }
}

class UserSidebar extends StatelessWidget {
  final bool isDarkMode;

  const UserSidebar({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        children: [
          // ── USER HEADER ───────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F5),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/images/header_pattern.png'), // Optional background pattern
                fit: BoxFit.cover,
                opacity: 0.1,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                  child:
                      const Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'SANKET SAHA',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout, size: 16),
                  label: const Text('Logout', style: TextStyle(fontSize: 12)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF68C238),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── MENU ITEMS ────────────────────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _buildSectionHeader(
                    Icons.dashboard_customize_outlined, 'Dashboard'),
                _buildMenuItem(context, 'My Learning', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CourseDashboard()),
                  );
                }),
                const Divider(height: 30, indent: 20, endIndent: 20),
                _buildSectionHeader(Icons.newspaper_outlined, 'News'),
                _buildMenuItem(context, 'For Learners', () {}),
                const Divider(height: 30, indent: 20, endIndent: 20),
                _buildSectionHeader(Icons.person_outline, 'Profile'),
                _buildMenuItem(context, 'Update Profile', () {}),
                _buildMenuItem(context, 'Badges & Certificates', () {}),
                _buildMenuItem(context, 'Discounts', () {}),
                _buildMenuItem(context, 'Learning History', () {}),
                _buildMenuItem(context, 'Transcript', () {}),
                const Divider(height: 30, indent: 20, endIndent: 20),
                _buildSectionHeader(Icons.language_outlined, 'Language',
                    trailing: const Text('English (English)',
                        style: TextStyle(color: Colors.grey, fontSize: 13))),
                const Divider(height: 30, indent: 20, endIndent: 20),
                _buildSectionHeader(Icons.chat_bubble_outline, 'Support'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.black87),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (trailing != null) ...[
            const Spacer(),
            trailing,
          ],
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            const SizedBox(width: 37), // Offset to align with section text
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, size: 18, color: Colors.green.shade400),
          ],
        ),
      ),
    );
  }
}
