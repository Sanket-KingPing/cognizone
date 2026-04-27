import 'package:flutter/material.dart';
import 'courseDashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _showRegistrationForm = false;
  // ignore: unused_field
  bool _showMyLearning = true;

  // Dropdown management
  final LayerLink _profileLayerLink = LayerLink();
  OverlayEntry? _profileOverlayEntry;
  bool _isProfileDropdownOpen = false;

  void _toggleProfileDropdown() {
    if (_isProfileDropdownOpen) {
      _closeProfileDropdown();
    } else {
      _openProfileDropdown();
    }
  }

  void _openProfileDropdown() {
    _profileOverlayEntry = _createProfileOverlayEntry();
    Overlay.of(context).insert(_profileOverlayEntry!);
    setState(() => _isProfileDropdownOpen = true);
  }

  void _closeProfileDropdown() {
    _profileOverlayEntry?.remove();
    _profileOverlayEntry = null;
    setState(() => _isProfileDropdownOpen = false);
  }

  OverlayEntry _createProfileOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeProfileDropdown,
              behavior: HitTestBehavior.translucent,
              child: const SizedBox.expand(),
            ),
          ),
          Positioned(
            width: 300,
            child: CompositedTransformFollower(
              link: _profileLayerLink,
              showWhenUnlinked: false,
              offset: const Offset(-200, 50),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 600),
                    child: UserSidebar(
                      isDropdown: true,
                      onMyLearningTap: () {
                        _closeProfileDropdown();
                        setState(() => _showMyLearning = true);
                      },
                      onDashboardTap: () {
                        _closeProfileDropdown();
                        setState(() => _showMyLearning = false);
                      },
                    ),
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
  void dispose() {
    _closeProfileDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 900;

        return Scaffold(
          backgroundColor: const Color(0xFFF4F6FA),
          body: Column(
            children: [
              // ── TOP ROW: Logo | Course Name ──────────────────────────────────
              Container(
                height: isMobile ? null : 100,
                padding:
                    isMobile ? const EdgeInsets.symmetric(vertical: 10) : null,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Company Logo (hidden or shrunk on mobile)
                    if (!isMobile)
                      Container(
                        width: 220,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A2342),
                          border: Border(
                            right: BorderSide(color: Colors.grey.shade300),
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Image(
                                image: AssetImage(
                                    'assets/images/CA MAIN Logo.png'),
                                height: 60,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Cognizone Academy',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    // Course Name + Back button
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 10 : 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                                width: 30), // Added padding since arrow is gone
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome to Cognizone Academy",
                                    style: TextStyle(
                                      fontSize: isMobile ? 18 : 22,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF0A2342),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Course Dashboard',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Profile section at the top right
                            if (!isMobile)
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: CompositedTransformTarget(
                                  link: _profileLayerLink,
                                  child: InkWell(
                                    onTap: _toggleProfileDropdown,
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Color(0xFF0A2342),
                                          child: Icon(Icons.person,
                                              size: 18, color: Colors.white),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          'SANKET SAHA',
                                          style: TextStyle(
                                            color: Color(0xFF0A2342),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Icon(
                                            _isProfileDropdownOpen
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: const Color(0xFF0A2342)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── BOTTOM ROW: Content ────────────────────────────────
              Expanded(
                child: Container(
                  color: const Color(0xFFF4F6FA),
                  child: _showRegistrationForm
                      ? _buildRegistrationForm(isMobile)
                      : const CourseDashboardContent(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToRegister() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  Widget _buildRegistrationForm(bool isMobile) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width - 40 : 450,
          padding: EdgeInsets.all(isMobile ? 20 : 40),
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Course Registration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2342),
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: "Course Name",
                readOnly: true,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Selected Course',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  labelText: 'Student ID',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _navigateToRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A2342),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: const Text('Confirm Registration',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              Center(
                child: TextButton(
                  onPressed: () =>
                      setState(() => _showRegistrationForm = false),
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.grey)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserSidebar extends StatelessWidget {
  final bool isDarkMode;
  final bool isDropdown;
  final VoidCallback onMyLearningTap;
  final VoidCallback onDashboardTap;

  const UserSidebar({
    super.key,
    this.isDarkMode = false,
    this.isDropdown = false,
    required this.onMyLearningTap,
    required this.onDashboardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isDropdown ? BorderRadius.circular(8) : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── USER HEADER ───────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            decoration: const BoxDecoration(
              color: Color(0xFFF0F2F5),
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
              ],
            ),
          ),

          // ── MENU ITEMS ────────────────────────────────────────────────────
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    onExpansionChanged: (expanded) {
                      if (expanded) onDashboardTap();
                    },
                    leading: const Icon(Icons.dashboard_customize_outlined,
                        color: Colors.black87),
                    title: const Text(
                      'Dashboard',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    children: [
                      _buildMenuItem(context, 'My Learning', onMyLearningTap),
                    ],
                  ),
                ),
                const Divider(height: 1, indent: 20, endIndent: 20),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading:
                        const Icon(Icons.person_outline, color: Colors.black87),
                    title: const Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    children: [
                      _buildMenuItem(context, 'Update Profile', () {}),
                      _buildMenuItem(context, 'Badges & Certificates', () {}),
                      _buildMenuItem(context, 'Learning History', () {}),
                    ],
                  ),
                ),
                const Divider(height: 1, indent: 20, endIndent: 20),
                _buildSectionHeader(Icons.language_outlined, 'Language',
                    trailing: const Text('English (English)',
                        style: TextStyle(color: Colors.grey, fontSize: 13))),
                const Divider(height: 1, indent: 20, endIndent: 20),
                _buildSectionHeader(Icons.logout_outlined, 'Logout'),
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
