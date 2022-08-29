class Constants {
  /// SharedPreferences keys.
  static const String isFirstRun = "IS_FIRST_RUN";

  static const String cachedBestSellerPhonesKey = "CACHED_PHONES_BEST_SELLER";
  static const String cachedHomestorePhonesKey = "CACHED_PHONES_HOMESTORE";
  static const String cachedExtendedPhonesKey = 'CACHED_EXTENDED_PHONES';

  /// Failure messages.
  static const String serverFailureMessage = "Something wrong with server.";
  static const String cacheFailureMessage =
      "Something wrong with cache loading.";
  static const String unexpectedFailureMessage = "Unexpected error raised.";

  /// FontFamilies.
  static const String primaryFontFamily = 'Mark';

  /// Proportional width & height.
  static const double propWidth = 414;
  static const double propHeight = 896;

  /// Strings.
  static const String logoTitle = "Ecommerce Concept";
  static const String selectCategory = "Select Category";
  static const String bestSeller = "Best Seller";
  static const String viewAll = "view all";
  static const String searchHintText = "Search";
  static const String hotSales = "Hot sales";
  static const String seeMore = "see more";
  static const String buyNow = "Buy now!";
  static const String explorer = "Explorer";
  static const String shop = "Shop";
  static const String favorite = "Favorite";
  static const String profile = "Profile";

  /// Maps.
  static const Map<String, String> categories = {
    'Phones': 'assets/icons/phone.svg',
    "Computers": "assets/icons/computer.svg",
    "Health": "assets/icons/health.svg",
    "Books": "assest/icons/books.svg",
    'Phones copy': 'assets/icons/phone.svg', // Just to make another category
  };

  static const Map<String, String> bottomNavBarItems = {
    'Explorer': "$iconRootUrl/explorer.svg",
    'Shop': "$iconRootUrl/cart.svg",
    'Favorites': "$iconRootUrl/heart.svg",
    "Profile": "$iconRootUrl/profile.svg",
  };

  /// Some constant urls.
  static const String iconRootUrl = "assets/icons/bottom_nav_bar";

  /// Primary animation duration.
  static const primaryDuration = Duration(milliseconds: 100);
}
