import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CampusConnectApp());
}

// ============================================================
// COLORS
// ============================================================

const Color navy = Color(0xFF111827);
const Color purple = Color(0xFF6C5CE7);
const Color blue = Color(0xFF3B82F6);
const Color cyan = Color(0xFF06B6D4);
const Color background = Color(0xFFF5F7FB);
const Color textDark = Color(0xFF172033);
const Color textGrey = Color(0xFF718096);

// ============================================================
// APP
// ============================================================

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusConnect',

      theme: ThemeData(
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: purple,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),

      home: const CampusHomePage(),
    );
  }
}

// ============================================================
// MAIN PAGE
// ============================================================

class CampusHomePage extends StatefulWidget {
  const CampusHomePage({super.key});

  @override
  State<CampusHomePage> createState() => _CampusHomePageState();
}

class _CampusHomePageState extends State<CampusHomePage>
    with SingleTickerProviderStateMixin {

  int currentIndex = 0;

  late AnimationController animationController;

  final List<String> pageTitles = [
    'CampusConnect',
    'Campus Activities',
    'My Profile',
  ];

  final List<Map<String, dynamic>> activities = [
    {
      'title': 'AI & Robotics Workshop',
      'date': '30 Sep',
      'time': '10:00 AM',
      'location': 'Innovation Lab',
      'color': const Color(0xFF6C5CE7),
      'icon': Icons.smart_toy_rounded,
    },
    {
      'title': 'Career & Internship Fair',
      'date': '02 Oct',
      'time': '11:00 AM',
      'location': 'University Hall',
      'color': const Color(0xFF06B6D4),
      'icon': Icons.work_outline_rounded,
    },
    {
      'title': 'Campus Sports Day',
      'date': '05 Oct',
      'time': '08:00 AM',
      'location': 'Sports Complex',
      'color': const Color(0xFF10B981),
      'icon': Icons.sports_soccer_rounded,
    },
  ];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: navy,
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.greenAccent,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(message),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // ======================================================
      // APP BAR
      // ======================================================

      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu_rounded,
                  color: navy,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            pageTitles[currentIndex],
            key: ValueKey(currentIndex),
            style: GoogleFonts.poppins(
              color: navy,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              showMessage('You are all caught up!');
            },
            icon: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                color: navy,
              ),
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),

      // ======================================================
      // DRAWER
      // ======================================================

      drawer: Drawer(
        backgroundColor: Colors.white,

        child: ListView(
          padding: EdgeInsets.zero,

          children: [

            Container(
              height: 270,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF111827),
                    Color(0xFF4338CA),
                    Color(0xFF6C5CE7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                ),
              ),

              padding: const EdgeInsets.fromLTRB(
                24,
                60,
                24,
                25,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Container(
                    width: 70,
                    height: 70,

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 2,
                      ),
                    ),

                    child: const Center(
                      child: Text(
                        'AB',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Amogh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    'Computer Science & Engineering',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Student ID • 26043571',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            drawerItem(
              icon: Icons.home_rounded,
              title: 'Home',
              selected: currentIndex == 0,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });

                Navigator.pop(context);
              },
            ),

            drawerItem(
              icon: Icons.event_rounded,
              title: 'Campus Activities',
              selected: currentIndex == 1,
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });

                Navigator.pop(context);
              },
            ),

            drawerItem(
              icon: Icons.person_rounded,
              title: 'My Profile',
              selected: currentIndex == 2,
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });

                Navigator.pop(context);
              },
            ),

            drawerItem(
              icon: Icons.school_rounded,
              title: 'My Courses',
              onTap: () {
                Navigator.pop(context);
                showMessage('Courses section coming soon.');
              },
            ),

            drawerItem(
              icon: Icons.location_on_rounded,
              title: 'Campus Map',
              onTap: () {
                Navigator.pop(context);
                showMessage('Campus Map selected.');
              },
            ),

            drawerItem(
              icon: Icons.settings_rounded,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
                showMessage('Settings selected.');
              },
            ),

            const Divider(
              height: 30,
              indent: 20,
              endIndent: 20,
            ),

            drawerItem(
              icon: Icons.help_outline_rounded,
              title: 'Help Centre',
              onTap: () {
                Navigator.pop(context);
                showMessage('Help Centre selected.');
              },
            ),
          ],
        ),
      ),

      // ======================================================
      // BODY
      // ======================================================

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.04, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },

        child: KeyedSubtree(
          key: ValueKey(currentIndex),
          child: getCurrentPage(),
        ),
      ),

      // ======================================================
      // FAB
      // ======================================================

      floatingActionButton: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 800),

        curve: Curves.elasticOut,

        builder: (context, value, child) {

          return Transform.scale(
            scale: value,
            child: child,
          );
        },

        child: FloatingActionButton.extended(

          backgroundColor: purple,

          elevation: 8,

          icon: const Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),

          label: const Text(
            'Add Activity',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          onPressed: () {

            setState(() {

              activities.add({
                'title': 'Student Networking Meetup',
                'date': '10 Oct',
                'time': '02:00 PM',
                'location': 'Student Centre',
                'color': const Color(0xFFF59E0B),
                'icon': Icons.groups_rounded,
              });

            });

            showMessage(
              'New campus activity added!',
            );
          },
        ),
      ),

      // ======================================================
      // BOTTOM NAVIGATION
      // ======================================================

      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),

        child: NavigationBar(

          backgroundColor: Colors.white,

          elevation: 0,

          selectedIndex: currentIndex,

          onDestinationSelected: (index) {

            setState(() {
              currentIndex = index;
            });

          },

          indicatorColor: purple.withOpacity(0.12),

          destinations: const [

            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
              ),
              selectedIcon: Icon(
                Icons.home_rounded,
              ),
              label: 'Home',
            ),

            NavigationDestination(
              icon: Icon(
                Icons.event_outlined,
              ),
              selectedIcon: Icon(
                Icons.event_rounded,
              ),
              label: 'Activities',
            ),

            NavigationDestination(
              icon: Icon(
                Icons.person_outline_rounded,
              ),
              selectedIcon: Icon(
                Icons.person_rounded,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // DRAWER ITEM
  // ==========================================================

  Widget drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool selected = false,
  }) {

    return Container(

      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 3,
      ),

      decoration: BoxDecoration(
        color: selected
            ? purple.withOpacity(0.1)
            : Colors.transparent,

        borderRadius: BorderRadius.circular(14),
      ),

      child: ListTile(

        onTap: onTap,

        leading: Icon(
          icon,
          color: selected
              ? purple
              : textGrey,
        ),

        title: Text(
          title,
          style: TextStyle(
            color: selected
                ? purple
                : textDark,
            fontWeight: selected
                ? FontWeight.w700
                : FontWeight.w500,
          ),
        ),

        trailing: selected
            ? const Icon(
          Icons.chevron_right_rounded,
          color: purple,
        )
            : null,
      ),
    );
  }

  // ==========================================================
  // PAGE SELECTOR
  // ==========================================================

  Widget getCurrentPage() {

    if (currentIndex == 0) {
      return homePage();
    }

    if (currentIndex == 1) {
      return activitiesPage();
    }

    return profilePage();
  }

  // ==========================================================
  // HOME
  // ==========================================================

  Widget homePage() {

    return ListView(

      padding: const EdgeInsets.fromLTRB(
        18,
        5,
        18,
        110,
      ),

      children: [

        // HERO CARD

        TweenAnimationBuilder<double>(

          tween: Tween(
            begin: 0,
            end: 1,
          ),

          duration: const Duration(
            milliseconds: 700,
          ),

          builder: (context, value, child) {

            return Opacity(
              opacity: value,

              child: Transform.translate(
                offset: Offset(
                  0,
                  30 * (1 - value),
                ),

                child: child,
              ),
            );
          },

          child: Container(

            height: 230,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(28),

              boxShadow: [
                BoxShadow(
                  color: purple.withOpacity(0.25),
                  blurRadius: 25,
                  offset: const Offset(0, 12),
                ),
              ],
            ),

            clipBehavior: Clip.antiAlias,

            child: Stack(

              children: [

                // CAMPUS IMAGE

                Positioned.fill(

                  child: Image.network(

                    'https://images.unsplash.com/photo-1562774053-701939374585?auto=format&fit=crop&w=1000&q=80',

                    fit: BoxFit.cover,

                    errorBuilder: (
                        context,
                        error,
                        stackTrace,
                        ) {

                      return Container(
                        color: purple,
                      );
                    },
                  ),
                ),

                // DARK OVERLAY

                Positioned.fill(

                  child: Container(

                    decoration: BoxDecoration(

                      gradient: LinearGradient(

                        colors: [
                          navy.withOpacity(0.95),
                          purple.withOpacity(0.55),
                          Colors.transparent,
                        ],

                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                ),

                // TEXT

                Positioned(
                  left: 22,
                  bottom: 22,

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      const Text(
                        'WELCOME TO',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'CampusConnect',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        'Your campus. Your community.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                // TOP ICON

                Positioned(
                  right: 18,
                  top: 18,

                  child: Container(

                    padding: const EdgeInsets.all(11),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.school_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // WELCOME

        Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const Text(
                    'Good evening,',
                    style: TextStyle(
                      color: textGrey,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 3),

                  const Text(
                    'Amogh 👋',
                    style: TextStyle(
                      color: textDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Container(

              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                  ),
                ],
              ),

              child: const Icon(
                Icons.person_rounded,
                color: purple,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // QUICK SERVICES

        sectionTitle(
          'Quick Access',
          'Everything you need',
        ),

        const SizedBox(height: 13),

        Row(
          children: [

            Expanded(
              child: quickService(
                Icons.local_library_rounded,
                'Library',
                const Color(0xFF6C5CE7),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: quickService(
                Icons.calendar_month_rounded,
                'Timetable',
                const Color(0xFF06B6D4),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: quickService(
                Icons.location_on_rounded,
                'Campus Map',
                const Color(0xFF10B981),
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        // STUDENT CARD

        Container(

          padding: const EdgeInsets.all(18),

          decoration: BoxDecoration(

            gradient: const LinearGradient(
              colors: [
                Color(0xFF111827),
                Color(0xFF252F4A),
              ],
            ),

            borderRadius: BorderRadius.circular(22),

            boxShadow: [
              BoxShadow(
                color: navy.withOpacity(0.18),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: Row(

            children: [

              Container(

                width: 52,
                height: 52,

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.school_rounded,
                  color: Colors.white,
                ),
              ),

              const SizedBox(width: 14),

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      'B.Tech CSE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 3),

                    Text(
                      'Semester 4-1 • Student',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white54,
                size: 16,
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // UPCOMING EVENTS

        sectionTitle(
          'Upcoming Events',
          'See what is happening',
        ),

        const SizedBox(height: 13),

        ...activities.take(2).map(
              (activity) => eventPreview(activity),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,

          child: OutlinedButton(

            onPressed: () {

              setState(() {
                currentIndex = 1;
              });

            },

            style: OutlinedButton.styleFrom(
              foregroundColor: purple,
              side: const BorderSide(
                color: purple,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
            ),

            child: const Text(
              'View All Activities',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // SECTION TITLE
  // ==========================================================

  Widget sectionTitle(
      String title,
      String subtitle,
      ) {

    return Row(

      crossAxisAlignment:
      CrossAxisAlignment.end,

      children: [

        Expanded(
          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(
                title,
                style: const TextStyle(
                  color: textDark,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                subtitle,
                style: const TextStyle(
                  color: textGrey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // QUICK SERVICE
  // ==========================================================

  Widget quickService(
      IconData icon,
      String title,
      Color color,
      ) {

    return InkWell(

      borderRadius: BorderRadius.circular(18),

      onTap: () {
        if (title == 'Campus Map') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CampusMapPage(),
            ),
          );
        } else {
          showMessage('$title selected.');
        }
      },

      child: Container(

        height: 110,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Container(

              padding: const EdgeInsets.all(11),

              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),

              child: Icon(
                icon,
                color: color,
                size: 25,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                color: textDark,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // EVENT PREVIEW
  // ==========================================================

  Widget eventPreview(
      Map<String, dynamic> activity,
      ) {

    return Container(

      margin: const EdgeInsets.only(
        bottom: 10,
      ),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          ),
        ],
      ),

      child: Row(

        children: [

          Container(

            width: 52,
            height: 60,

            decoration: BoxDecoration(
              color: activity['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Icon(
              activity['icon'],
              color: activity['color'],
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  activity['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  '${activity['date']} • ${activity['time']}',
                  style: const TextStyle(
                    color: textGrey,
                    fontSize: 11,
                  ),
                ),

                Text(
                  activity['location'],
                  style: const TextStyle(
                    color: textGrey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.chevron_right_rounded,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // ACTIVITIES PAGE
  // ==========================================================

  Widget activitiesPage() {

    return ListView(

      padding: const EdgeInsets.fromLTRB(
        18,
        5,
        18,
        110,
      ),

      children: [

        const SizedBox(height: 5),

        const Text(
          'Discover',
          style: TextStyle(
            color: textGrey,
            fontSize: 14,
          ),
        ),

        const Text(
          'Campus Activities',
          style: TextStyle(
            color: textDark,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Connect, learn and enjoy campus life.',
          style: TextStyle(
            color: textGrey,
          ),
        ),

        const SizedBox(height: 20),

        Container(

          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF6C5CE7),
                Color(0xFF4F46E5),
              ],
            ),

            borderRadius: BorderRadius.circular(22),
          ),

          child: const Row(

            children: [

              Icon(
                Icons.explore_rounded,
                color: Colors.white,
                size: 38,
              ),

              SizedBox(width: 14),

              Expanded(
                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Explore Campus Life',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      'Find events that match your interests.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 22),

        ...activities.map(
              (activity) => fullActivityCard(activity),
        ),
      ],
    );
  }

  // ==========================================================
  // ACTIVITY CARD
  // ==========================================================

  Widget fullActivityCard(
      Map<String, dynamic> activity,
      ) {

    return Container(

      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),

      child: Padding(

        padding: const EdgeInsets.all(17),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Row(

              children: [

                Container(

                  width: 55,
                  height: 55,

                  decoration: BoxDecoration(
                    color: activity['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Icon(
                    activity['icon'],
                    color: activity['color'],
                    size: 28,
                  ),
                ),

                const SizedBox(width: 13),

                Expanded(
                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        activity['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textDark,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        activity['location'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: textGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(

              children: [

                eventInfo(
                  Icons.calendar_today_rounded,
                  activity['date'],
                ),

                const SizedBox(width: 18),

                eventInfo(
                  Icons.access_time_rounded,
                  activity['time'],
                ),
              ],
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  showMessage(
                    '${activity['title']} registered successfully!',
                  );

                },

                style: ElevatedButton.styleFrom(

                  backgroundColor:
                  activity['color'],

                  foregroundColor:
                  Colors.white,

                  elevation: 0,

                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),

                child: const Text(
                  'Register for Event',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // EVENT INFO
  // ==========================================================

  Widget eventInfo(
      IconData icon,
      String text,
      ) {

    return Row(

      children: [

        Icon(
          icon,
          size: 15,
          color: textGrey,
        ),

        const SizedBox(width: 5),

        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            color: textGrey,
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // PROFILE
  // ==========================================================

  Widget profilePage() {

    return ListView(

      padding: const EdgeInsets.fromLTRB(
        18,
        5,
        18,
        110,
      ),

      children: [

        const SizedBox(height: 10),

        Center(

          child: Container(

            width: 120,
            height: 120,

            decoration: BoxDecoration(

              gradient: const LinearGradient(
                colors: [
                  purple,
                  blue,
                ],
              ),

              shape: BoxShape.circle,

              boxShadow: [
                BoxShadow(
                  color: purple.withOpacity(0.3),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),

            child: const Center(

              child: Text(
                'AB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 18),

        const Center(
          child: Text(
            'Amogh',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: textDark,
            ),
          ),
        ),

        const SizedBox(height: 4),

        const Center(
          child: Text(
            'B.Tech Computer Science & Engineering',
            style: TextStyle(
              color: textGrey,
              fontSize: 13,
            ),
          ),
        ),

        const SizedBox(height: 25),

        profileInfo(
          Icons.badge_rounded,
          'Student ID',
          '26043571',
        ),

        profileInfo(
          Icons.school_rounded,
          'Programme',
          'B.Tech Computer Science & Engineering',
        ),

        profileInfo(
          Icons.email_rounded,
          'Email',
          'student@university.edu',
        ),

        profileInfo(
          Icons.calendar_month_rounded,
          'Semester',
          '4-1',
        ),

        profileInfo(
          Icons.location_city_rounded,
          'Campus',
          'Vijayawada',
        ),
      ],
    );
  }

  // ==========================================================
  // PROFILE INFO
  // ==========================================================

  Widget profileInfo(
      IconData icon,
      String title,
      String value,
      ) {

    return Container(

      margin: const EdgeInsets.only(
        bottom: 11,
      ),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(17),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          ),
        ],
      ),

      child: Row(

        children: [

          Container(

            width: 45,
            height: 45,

            decoration: BoxDecoration(
              color: purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(13),
            ),

            child: Icon(
              icon,
              color: purple,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: textGrey,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  value,
                  style: const TextStyle(
                    color: textDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class CampusMapPage extends StatelessWidget {
  const CampusMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        title: const Text(
          'Campus Map',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Campus Map'),
                    content: const Text(
                      'Pinch to zoom and drag the map to explore different campus locations.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        boundaryMargin: const EdgeInsets.all(100),

        child: Center(
          child: Image.asset(
            'assets/maps/campus_map.png',
            fit: BoxFit.contain,

            errorBuilder: (
                context,
                error,
                stackTrace,
                ) {
              return const Center(
                child: Text(
                  'Campus map could not be loaded.',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
